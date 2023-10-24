package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func main() {

	sigs := make(chan os.Signal, 1)

	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)

	done := make(chan bool, 1)

	go func() {
		sig := <-sigs
		fmt.Printf("\nreceived signal '%v'\n", sig)
		done <- true
	}()

	fmt.Printf("started with pid: %v\n", os.Getpid())
	fmt.Println("awaiting signal")
	<-done
	fmt.Println("exiting")
}

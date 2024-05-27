package main

import (
	"github.com/gin-gonic/gin"
	"github.com/sysrex/ipinfo.lol/internal"
)

func main() {
	router := gin.Default()
	router.GET("/", getIP())
	err := router.Run("0.0.0.0:8080")
	if err != nil {
		panic(err)
	}
}

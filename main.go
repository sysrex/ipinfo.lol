package main

import (
	"github.com/gin-gonic/gin"
)

func getIP(c *gin.Context) {
	c.JSON(200, gin.H{
		"ip": c.ClientIP(),
	})
}

func main() {
	router := gin.Default()
	router.GET("/", getIP)
	err := router.Run("0.0.0.0:8080")
	if err != nil {
		panic(err)
	}
}

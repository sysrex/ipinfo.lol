package internal

import "github.com/gin-gonic/gin"

func getIP(c *gin.Context) {
	c.JSON(200, gin.H{
		"ip": c.ClientIP(),
	})
}

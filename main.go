package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

// 处理web请求
func handle(c *gin.Context) {
	c.JSON(200, gin.H{"message": "pong"})
}

func main() {
	fmt.Println("Hello World!")

	r := gin.Default()
	r.GET("/ping", handle)

	err := r.Run(":8080")
	if err != nil {
		panic(err)
	}
}

package handlers

import (
	"context"
	"log"
	"os"

	"hello-world/models"
)

func HandleRequest(ctx context.Context, name models.Request) (models.Response, error) {
	env_var1 := os.Getenv("PARAM1")

	response := models.Response{
		Hello: name.Name,
	}
	log.Println(env_var1)
	return response, nil
}

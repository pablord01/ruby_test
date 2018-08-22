class ArticlesController < ApplicationController
   #GET /articles
    def index
        @articles = Article.all
   end
    #GET /articles/:id
    def show
        @article = Article.find(params[:id])
    end
    #GET /articles/new
    def new
        @article = Article.new
    end
    def edit
        @article = Article.find(params[:id])
    end
    #POST /articles
    def create
        @article = Article.new(title: params[:article][:title], 
                                body: params[:article][:body])
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end
    #PUT /articles/:id
    def update
        @article = Article.find(params[:id])
        if @article.update(title: params[:article][:title],
                            body: params[:article][:body])
            redirect_to @article
        else
            render :edit
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
end
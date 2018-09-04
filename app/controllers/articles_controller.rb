class ArticlesController < ApplicationController
   before_action :authenticate_user!, except: [:show, :index]
   before_action :set_article, except: [:index, :new, :create]
    #GET /articles
    def index
        @articles = Article.all
   end
    #GET /articles/:id
    def show
        @article.update_visits_count
        @comment = Comment.new
    end
    #GET /articles/new
    def new
        @article = Article.new
    end
    def edit
    end
    #POST /articles
    def create
        @article = current_user.articles.new(title: params[:article][:title], 
                                body: params[:article][:body])
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end
    #PUT /articles/:id
    def update
        if @article.update(title: params[:article][:title],
                            body: params[:article][:body])
            redirect_to @article
        else
            render :edit
        end
    end
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    private
    def set_article
        @article = Article.find(params[:id])
    end
    def validate_user
        redirect_to new_user_session_path, notice: "Necesitas Iniciar sesión"
    end
end
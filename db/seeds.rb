Review.destroy_all
Categorization.destroy_all
Book.destroy_all
Category.destroy_all
User.destroy_all

User.create!(
  username: "test",
  email: "test@example.com",
  password: "123456",
  password_confirmation: "123456"
)

fantasy = Category.create(name: "Fantasy")
scifi = Category.create(name: "Sci-Fi")
classic = Category.create(name: "Classic")
mystery = Category.create(name: "Mystery")
romance = Category.create(name: "Romance")
horror = Category.create(name: "Horror")
adventure = Category.create(name: "Adventure")
history = Category.create(name: "History")
philosophy = Category.create(name: "Philosophy")
drama = Category.create(name: "Drama")
thriller = Category.create(name: "Thriller")

books = []

def create_book(title, author, categories)
  book = Book.create(title: title, author: author)
  categories.each do |cat|
    Categorization.create(book: book, category: cat)
  end
  book
end

books << create_book("Harry Potter and the Sorcerer's Stone", "J.K. Rowling", [fantasy, adventure])
books << create_book("Harry Potter and the Chamber of Secrets", "J.K. Rowling", [fantasy, adventure])
books << create_book("Harry Potter and the Prisoner of Azkaban", "J.K. Rowling", [fantasy, mystery])

books << create_book("1984", "George Orwell", [scifi, classic, philosophy])
books << create_book("Animal Farm", "George Orwell", [classic, philosophy])

books << create_book("Pride and Prejudice", "Jane Austen", [romance, classic])
books << create_book("Emma", "Jane Austen", [romance, classic, drama])

books << create_book("The Hobbit", "J.R.R. Tolkien", [fantasy, adventure])
books << create_book("The Lord of the Rings", "J.R.R. Tolkien", [fantasy, adventure])
books << create_book("The Silmarillion", "J.R.R. Tolkien", [fantasy, history])

books << create_book("The Da Vinci Code", "Dan Brown", [mystery, thriller])
books << create_book("Angels & Demons", "Dan Brown", [mystery, thriller])
books << create_book("Inferno", "Dan Brown", [mystery, history])

books << create_book("The Great Gatsby", "F. Scott Fitzgerald", [classic, drama])
books << create_book("To Kill a Mockingbird", "Harper Lee", [classic, drama])
books << create_book("The Catcher in the Rye", "J.D. Salinger", [classic, drama])

books << create_book("Dracula", "Bram Stoker", [horror, classic])
books << create_book("Frankenstein", "Mary Shelley", [horror, scifi, classic])

books << create_book("War and Peace", "Leo Tolstoy", [history, classic])
books << create_book("Crime and Punishment", "Fyodor Dostoevsky", [philosophy, classic, drama])

books << create_book("Moby Dick", "Herman Melville", [adventure, classic])

#books.sample(10).each do |book|
#  Review.create(
#    content: "A very meaningful and well-written book.",
#    rating: rand(4..5),
#    user: user,
#    book: book
#  )
#end

puts "Realistic seed data created!"
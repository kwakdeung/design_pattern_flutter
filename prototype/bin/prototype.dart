// Prototype Pattern(프로토타입 패턴)이란?

// 복제해서 인스턴스를 만드는 패턴
// - 클래스의 인스턴스가 생성과정이 복잡하거나 여러 조합에 의해 생성되어야
// 하는 경우 하나의 견본(prototype)을 만들어 초기화해두고 이를 복제해서 객체를
// 생성하는 방법
// - 프로토타입 속성값을 활용하여 다양한 객체를 생성할 수 있음
// - 서브 클래스의 수를 줄일 수 있다.
// 자바에서는 clone() 메서드를 재정의하여 구현한다.

class Book {
  String author;
  String title;

  Book(this.author, this.title);
  String getAuthor() {
    return author;
  }

  void setAuthor(String author) {
    this.author = author;
  }

  String getTitle() {
    return title;
  }

  void setTitle(String title) {
    this.title = title;
  }

  String toString() {
    return "(" + author + "," + title + ")";
  }
}

class BookShelf {
  late List<Book> shelf;

  BookShelf() {
    shelf = <Book>[];
  }

  void addBook(Book book) {
    shelf.add(book);
  }

  BookShelf clone() {
    BookShelf another = BookShelf();
    for (Book book in shelf) {
      another.addBook(Book(book.author, book.title));
    }

    return another;
  }

  @override
  String toString() {
    return shelf.toString();
  }
}

void main() {
  BookShelf bookShelf = BookShelf();

  bookShelf.addBook(Book('조정래', '태백산맥'));
  bookShelf.addBook(Book('박완서', '나목'));
  bookShelf.addBook(Book('박경리', '토지'));

  print(bookShelf);

  BookShelf another = bookShelf.clone(); // 복제하기

  print(another); // 복제 결과

  bookShelf.shelf[0].author = '조정래';
  bookShelf.shelf[0].author = '한강';

  print(bookShelf); // 복제 후 바뀐 상태
  print(another); // 복제 후 안바뀐 상태
}

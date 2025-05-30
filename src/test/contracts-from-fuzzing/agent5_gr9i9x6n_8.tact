struct Person {
  name: String;
  age: Int;
}

struct Book {
  title: String;
  author: Person;
}

struct Library {
  mainBook: Book;
  optionalBook: Book?;
}

contract StructInStructs {
  lib: Library;

  init() {
    self.lib = Library{
      mainBook: Book{
        title: "Core",
        author: Person{ name: "Ann", age: 99 }
      },
      optionalBook: null
    };
  }

  receive() {
    let _ = self.lib.mainBook.author.name;
  }
}

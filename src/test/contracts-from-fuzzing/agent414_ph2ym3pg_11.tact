struct Person {
    name: String;
    age: Int;
    address: Address;
    comment: String?;
}

struct Book {
    title: String;
    pages: Int;
    author: Person;
    reviewer: Person?;
}

contract NestedComplex {
    savedBook: Book;
    init() {
        self.savedBook = Book{
            title: "Fuzz Book",
            pages: 100,
            author: Person{ name: "Somebody", age: 33, address: myAddress(), comment: null },
            reviewer: null
        };
    }
}

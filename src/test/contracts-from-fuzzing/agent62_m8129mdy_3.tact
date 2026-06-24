struct Person {
    name: String;
    age: Int;
}

contract GetterTestComposite {
    p: Person = Person { name: "Alice", age: 30 };

    receive() {}

    get fun getPerson(): Person {
         return self.p;
    }
}

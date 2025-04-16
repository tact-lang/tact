struct Person {
    age: Int;
    name: String;
}

contract TestStructGetter {
    person: Person = Person{ age: 30, name: "Alice" };

    receive() {}

    get fun getPerson(): Person {
        return self.person;
    }
}

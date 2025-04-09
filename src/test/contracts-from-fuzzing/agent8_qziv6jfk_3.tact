struct Person { name: String; age: Int }

contract TestGetterStruct {
    person: Person = Person { name: "Alice", age: 30 };

    receive() {}

    get fun getPerson(): Person {
        return self.person;
    }
}

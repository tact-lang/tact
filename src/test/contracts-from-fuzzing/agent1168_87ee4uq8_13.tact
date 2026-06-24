struct Person {
    name: String;
    age: Int;
    married: Bool;
    child: Child?;
}

struct Child {
    name: String;
    age: Int;
}

contract Family {
    p: Person;

    init() {
        self.p = Person {
            name: "Alice",
            age: 30,
            married: true,
            child: Child {
                name: "Bob",
                age: 5
            }
        };
    }
}
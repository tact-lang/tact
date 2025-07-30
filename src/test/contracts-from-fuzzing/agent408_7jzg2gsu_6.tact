struct Child {
    name: String;
    age: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
}

contract Family {
    info: Parent;

    init() {
        self.info = Parent {
            child1: Child{ name: "Ann", age: 5 },
            child2: Child{ name: "Bob", age: 7 }
        };
    }
}
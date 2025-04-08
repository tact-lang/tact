struct Child {
    name: String;
    age: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract Family {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{ name: "a", age: 1 },
            child2: Child{ name: "b", age: 2 },
            child3: Child{ name: "c", age: 3 }
        };
    }
}
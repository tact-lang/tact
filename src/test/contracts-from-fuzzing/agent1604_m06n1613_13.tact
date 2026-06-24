struct Child {
    x: Int = 1;
    y: Int = 2;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract MultiNested {
    value: Parent;

    init() {
        self.value = Parent {
            child1: Child { x:5, y:6 },
            child2: Child { x:7, y:8 },
            child3: Child { x:9, y:10 }
        };
    }

    receive() {}
}
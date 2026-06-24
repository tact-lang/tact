struct Child {
    number: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
    child4: Child;
    child5: Child;
}

contract ManyNested {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{ number:1 },
            child2: Child{ number:2 },
            child3: Child{ number:3 },
            child4: Child{ number:4 },
            child5: Child{ number:5 }
        };
    }
}

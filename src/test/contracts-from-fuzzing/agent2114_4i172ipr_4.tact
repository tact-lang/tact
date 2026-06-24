struct Child {
    a: Int;
    b: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
    child3: Child;
}

contract OptionalStructField {
    data: Parent?;
    
    init() {
        self.data = Parent{
            child1: Child{a: 1, b: true},
            child2: Child{a: 2, b: false},
            child3: Child{a: 3, b: true},
        };
    }
}

struct Child {
    num: Int;
    opt: Bool?;
}

struct Parent {
    child1: Child;
    child2: Child;
}

contract CombinedOptionals {
    data: Parent;
    
    init() {
        self.data = Parent{
            child1: Child{ num: 1, opt: null },
            child2: Child{ num: 2, opt: true }
        };
    }
}
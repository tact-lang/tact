struct Child {
    a: Int;
    flag: Bool;
}

struct Parent {
    field1: Int;
    child1: Child;
    child2: Child;
}

contract MultiNestedFields {
    stuff: Parent;

    init() {
        self.stuff = Parent{
            field1: 10,
            child1: Child{a:1, flag:false},
            child2: Child{a:2, flag:true}
        };
    }
}
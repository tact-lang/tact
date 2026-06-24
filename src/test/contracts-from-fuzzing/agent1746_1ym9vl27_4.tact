struct Child {
    flag: Bool;
    value: Int;
    label: String;
}

struct Parent {
    child1: Child;
    child2: Child;
    number: Int;
}

contract TestContract {
    data: Parent;

    init() {
        self.data = Parent{
            child1: Child{ flag:true, value:1, label:"A" },
            child2: Child{ flag:false, value:2, label:"B" },
            number: 42
        };
    }
}
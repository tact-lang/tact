struct Child {
    val1: Int;
    val2: String;
}

struct Parent {
    a: Int;
    childOpt: Child?;
    b: Bool;
}

contract NestedOptional {
    data: Parent = Parent{
        a: 1,
        childOpt: null,
        b: true
    };
    init() {
        self.data = Parent{
            a: 100,
            childOpt: Child{ val1: 5, val2: "hello" },
            b: false
        };
    }
}

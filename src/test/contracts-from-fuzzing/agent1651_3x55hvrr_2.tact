struct Nested {
    inside: Bool;
}

struct Outer {
    first: Int;
    opt: Nested?;
}

contract Test2 {
    var1: Outer;

    init() {
        self.var1 = Outer{first: 0, opt: null};
    }
}

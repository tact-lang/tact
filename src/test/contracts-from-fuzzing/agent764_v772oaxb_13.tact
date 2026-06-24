struct NestedOptional {
    nested1: Inner?;
}

struct Inner {
    nested2: Innermost?;
}

struct Innermost {
    val: Int;
}

contract NestedOpt {
    n: NestedOptional;
    init() {
        self.n = NestedOptional{
            nested1: null
        };
    }
}
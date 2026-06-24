struct Inner {
    val: Int = 5;
}

struct Outer {
    innerOpt: Inner?;
}

contract NestedOptStruct {
    nested: Outer;

    init() {
        self.nested = Outer{ innerOpt: null };
    }
}
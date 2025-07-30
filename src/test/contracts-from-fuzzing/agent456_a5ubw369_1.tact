struct Inner {
    flag: Bool;
}

struct Outer {
    nested: Inner?;
}

contract NestedOptionalStruct {
    val: Outer;

    init() {
        self.val = Outer{ nested: null };
    }
}
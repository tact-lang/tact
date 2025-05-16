struct OptNested {
    a: Int?;
    b: Inner?;
}

struct Inner {
    z: Int;
}

contract OptNestedStruct {
    val: OptNested;
    init() {
        self.val = OptNested{ a: null, b: null };
    }
}
struct OptionalNested {
    opt: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalStruct {
    st: OptionalNested;
    init() {
        self.st = OptionalNested{ opt: null };
    }
}
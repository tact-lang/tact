struct Nested {
    i1: Int;
    inner: StructIn;
}

struct StructIn {
    str: String;
    bval: Bool;
}

contract OptionalStruct {
    opt: Nested?;

    init() {
        self.opt = null;
    }
}

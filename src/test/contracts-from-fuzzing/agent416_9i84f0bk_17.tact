struct Nested {
    inner1: Int?;
    inner2: Bool?;
}

contract MultiOptNested {
    nestedOpt: Nested?;
    val: Int?;

    init() {
        self.nestedOpt = null;
        self.val = null;
    }
}
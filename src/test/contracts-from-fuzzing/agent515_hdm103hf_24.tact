struct Nested {
    s: String;
}

contract OptionalStringStruct {
    nestedOpt: Nested?;
    msg: String;

    init() {
        self.nestedOpt = null;
        self.msg = "hi";
    }
}

message(10) InnerMsg {
    foo: Int;
    bar: Bool?;
}

message(11) OuterMsg {
    nested: InnerMsg;
    note: String?;
}

contract OptionalNestedMsg {
    data: OuterMsg?;

    init() {
        self.data = null;
    }
}
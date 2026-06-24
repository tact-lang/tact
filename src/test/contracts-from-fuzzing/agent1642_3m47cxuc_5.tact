struct Inner {
    s: String;
    n: Int;
    b: Bool;
    optStr: String?;
}

contract NestedOptionalFields {
    data: Inner?;

    init() {
        self.data = null;
    }
}
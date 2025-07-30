struct Crazy {
    a: Int;
    b: Bool;
    c: Int?;
    d: String?;
    e: Address;
    f: Bool;
    g: Int?;
    h: String;
}

contract NestedInsideOpt {
    field: Crazy?;
    init() {
        self.field = null;
    }
}
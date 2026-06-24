struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOpt {
    nested: NestedOpt?;
    d: String;
    e: Int;
}

contract ContractX {
    val: OuterOpt?;

    init() {
        self.val = null;
    }
}
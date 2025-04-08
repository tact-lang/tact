struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: NestedOpt?;
}

contract NestedOptFields {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ inner: null };
    }
}
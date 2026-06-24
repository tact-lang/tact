struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    c: String?;
}

contract NestedNulls {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ inner: null, c: null };
    }
}
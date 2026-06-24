struct InnerOpt {
    s: String?;
    flag: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    val: Int?;
}

contract TestOptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ inner: null, val: null };
    }
}
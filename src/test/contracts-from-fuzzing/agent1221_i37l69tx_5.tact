struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract NestedNulls {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ nested: null };
    }
}
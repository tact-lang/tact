struct OuterOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    num: Int?;
    text: String?;
}

contract NestedOptionals {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ nested: null };
    }
}
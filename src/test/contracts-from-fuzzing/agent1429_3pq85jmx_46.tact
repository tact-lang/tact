struct InnerOpt {
    x: Int? = 3;
}

struct OuterOpt {
    inner: InnerOpt? = InnerOpt{ x: 5 };
}

contract NestedOptDefault {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ inner: null };
    }
}
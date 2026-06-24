struct InnerS {
    val: Int;
}

struct OuterS {
    inner: InnerS;
}

contract NestedSimple {
    val: OuterS;

    init() {
        self.val = OuterS{ inner: InnerS{ val: 123 } };
    }
}

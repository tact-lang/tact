struct InnerOpt {
    val: Int;
}

struct OuterOpt {
    nestedOpt: InnerOpt?;
}

contract NestedOptionalStruct {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nestedOpt: InnerOpt{val: 99}
        };
    }
}
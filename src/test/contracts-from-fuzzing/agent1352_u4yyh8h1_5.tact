struct InnerOpt {
    val: Int;
}

struct OuterStruct {
    optInner: InnerOpt?;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{ optInner: InnerOpt{ val: 123 } };
    }
}

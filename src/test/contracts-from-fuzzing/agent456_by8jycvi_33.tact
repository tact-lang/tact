struct InnerWithOptional {
    val: Int?;
}

struct OuterWithNestedOpt {
    inner: InnerWithOptional;
}

contract NestedOptInStruct {
    data: OuterWithNestedOpt;

    init() {
        self.data = OuterWithNestedOpt{
            inner: InnerWithOptional{ val: null }
        };
    }
}
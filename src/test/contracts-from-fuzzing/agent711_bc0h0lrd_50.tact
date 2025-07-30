struct OuterS {
    inner: InnerS?;
}

struct InnerS {
    val: Int?;
}

contract NestedOptionalStruct {
    state: OuterS;
    init() {
        self.state = OuterS{
            inner: InnerS{
                val: null
            }
        };
    }
}

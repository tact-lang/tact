struct InnerNested {
    val1: Int = 11;
    optBool: Bool?;
}

struct OuterNested {
    flag: Bool = false;
    inner: InnerNested;
}

contract TestContract {
    nested: OuterNested;
    init() {
        self.nested = OuterNested{
            inner: InnerNested{
                val1: 123,
                optBool: true
            },
            flag: true
        };
    }
    receive() {
        self.nested.flag = false;
    }
}
struct NestedOptStruct {
    a: Int;
    b: String?;
}

struct Chain {
    inner: NestedOptStruct?;
}

contract TestContract {
    chain: Chain;

    init() {
        self.chain = Chain{
            inner: NestedOptStruct{
                a: 3,
                b: null
            }
        };
    }
}
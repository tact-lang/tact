struct Nested1Opt {
    x: Int?;
}

struct Nested2Opt {
    inner: Nested1Opt?;
}

contract DoubleOptionalStruct {
    state: Nested2Opt;

    init() {
        self.state = Nested2Opt{
            inner: null
        };
    }
}
struct Inner {
    addr: Address?;
}

struct Outer {
    fixed: Address;
    optInner: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            fixed: myAddress(),
            optInner: Inner{
                addr: null
            }
        };
    }
}

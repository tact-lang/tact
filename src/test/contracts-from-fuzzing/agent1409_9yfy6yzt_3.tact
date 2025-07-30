struct Inner {
    flag: Bool;
}

struct Outer {
    number: Int;
    inner: Inner;
}

contract TestContract {
    nestedStruct: Outer;
    
    init() {
        self.nestedStruct = Outer{
            number: 10,
            inner: Inner{ flag: false }
        };
    }
}

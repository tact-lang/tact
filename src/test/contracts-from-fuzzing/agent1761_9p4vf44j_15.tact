contract TestContract {
    nestedStruct: Outer;

    init() {
        self.nestedStruct = Outer{
            flag: true,
            inner: Inner{
                value: 777
            }
        };
    }
}

struct Outer {
    flag: Bool;
    inner: Inner;
}

struct Inner {
    value: Int;
}
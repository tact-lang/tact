struct Inner {
    value: Int = 777;
}

struct Outer {
    inner: Inner;
    flag: Bool = true;
}

contract StorageTest {
    nestedStruct: Outer;

    init() {
        self.nestedStruct = Outer{
            inner: Inner{ value: 888 },
            flag: false,
        };
    }
}
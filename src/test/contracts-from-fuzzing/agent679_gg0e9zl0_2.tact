struct NestedStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    inner: NestedStruct;
    num: Int;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct {
            inner: NestedStruct{
                a: 1,
                b: true,
            },
            num: 7,
        };
    }
}
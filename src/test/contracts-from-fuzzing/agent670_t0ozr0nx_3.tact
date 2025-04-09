struct NestedStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    inner: NestedStruct;
    z: Int;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: NestedStruct{
                x: 1,
                y: 2,
            },
            z: 3,
        };
    }
}
struct NestedStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    x: NestedStruct;
    y: Int;
    z: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            x: NestedStruct{ a: 1, b: true },
            y: 2,
            z: false,
        };
    }
}

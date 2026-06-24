struct NestedPoint {
    x: Int;
    y: Int;
}

struct ComplexStruct {
    flag: Bool;
    count: Int;
    info: NestedPoint;
    label: String;
    maybeData: Slice?;
}

contract TestContract {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            flag: true,
            count: 42,
            info: NestedPoint{ x: 1, y: 2 },
            label: "Hello",
            maybeData: null
        };
    }
}
struct InnerStruct {
    x: Int;
    y: Int;
}

contract NestedStructContract {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{ x: 1, y: 2 };
    }
}
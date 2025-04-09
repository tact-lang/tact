struct InnerStruct {
    x: Int;
    y: Int;
}

contract TestContract {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{ x: 1, y: 2 };
    }
}
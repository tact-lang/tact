struct InnerStruct {
    x: Int;
    y: Int;
}

contract UsesStruct {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{ x: 7, y: 9 };
    }
}
struct NestedStruct {
    x: Int;
    y: Int;
}

contract TestContract {
    point: NestedStruct;

    init() {
        self.point = NestedStruct{
            x: 1,
            y: 2,
        };
    }
}
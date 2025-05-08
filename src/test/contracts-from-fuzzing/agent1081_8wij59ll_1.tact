struct NestedStruct {
    x: Int;
    y: Int?;
    s: String;
}

contract TestContract {
    point: NestedStruct;

    init() {
        self.point = NestedStruct{ x: 1, y: null, s: "hello" };
    }
}
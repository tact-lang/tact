struct NestedStruct {
    x: Int;
    y: Bool;
}

contract Arrayed {
    f1: Int = 1;
    f2: NestedStruct;
    f3: NestedStruct;
    f4: Int = 4;
    init() {
        self.f2 = NestedStruct{x: 10, y: true};
        self.f3 = NestedStruct{x: 20, y: false};
    }
}
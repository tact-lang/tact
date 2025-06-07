struct NestedStruct {
    x: Int;
    y: Int?;
}

contract TestStorage {
    point: NestedStruct;
    
    init() {
        self.point = NestedStruct{ x: 1, y: null };
    }
}
struct AStruct {
    x:Int;
    y:Int;
}

contract WithTwoStructs {
    a: AStruct;
    b: AStruct;
    init() {
        self.a = AStruct{ x:3, y:4 };
        self.b = AStruct{ x:5, y:6 };
    }
}
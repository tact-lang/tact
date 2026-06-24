struct IntStringBool {
    x: Int;
    y: String;
    z: Bool;
}

contract ArrayStyle {
    f1: IntStringBool;
    f2: IntStringBool;

    init() {
        self.f1 = IntStringBool{ x:1, y:"a", z:true };
        self.f2 = IntStringBool{ x:2, y:"b", z:false };
    }
}
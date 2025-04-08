struct IntBool {
    x: Int;
    y: Bool;
}

contract ListOfStructs {
    a: IntBool;
    b: IntBool;
    c: IntBool;
    d: IntBool;

    init() {
        self.a = IntBool{ x:1, y:true };
        self.b = IntBool{ x:2, y:false };
        self.c = IntBool{ x:3, y:true };
        self.d = IntBool{ x:4, y:false };
    }

    receive() {
        self.d = IntBool{ x:5, y:true };
    }
}
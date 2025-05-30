struct PrimitiveMix {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
}

contract DirectPrimitives {
    a: Int;
    b: Bool;
    s: String;
    composite: PrimitiveMix;

    init() {
        self.a = 42;
        self.b = false;
        self.s = "hi";
        self.composite = PrimitiveMix{
            intVal: 1,
            boolVal: true,
            stringVal: "hey",
        };
    }
}
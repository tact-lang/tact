struct SNested {
    x: Int;
    y: Bool;
    z: String;
}

contract PrimitiveAndStruct {
    a: Int;
    b: SNested;
    c: Bool;
    d: String;

    init() {
        self.a = 5;
        self.b = SNested{ x: 1, y: false, z: "hi" };
        self.c = true;
        self.d = "str";
    }
}
struct StructA {
    x: Int;
}

struct StructB {
    y: Bool;
}

struct StructC {
    z: String;
}

contract TestContract {
    a: StructA;
    b: StructB;
    c: StructC;

    init() {
        self.a = StructA{ x: 10 };
        self.b = StructB{ y: true };
        self.c = StructC{ z: "hi" };
    }
}
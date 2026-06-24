struct StructA { x: Int; }
struct StructB { y: String; }
struct StructC { z: Bool; }

contract MultiStructs {
    a: StructA;
    b: StructB;
    c: StructC;

    init() {
        self.a = StructA{ x: 1 };
        self.b = StructB{ y: "str" };
        self.c = StructC{ z: true };
    }
}
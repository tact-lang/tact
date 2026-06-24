struct StructA {
    x: Int;
}

struct StructB {
    y: Int;
}

struct StructC {
    z: Int;
}

contract ManyStructs {
    a: StructA;
    b: StructB;
    c: StructC;

    init() {
        self.a = StructA{x: 1};
        self.b = StructB{y: 2};
        self.c = StructC{z: 3};
    }
}
struct StructA {
    x: Int;
}

struct StructB {
    a: StructA;
    y: Int;
}

struct StructC {
    b: StructB;
    z: Int;
}

contract TestContract {
    storage: StructC;
    init() {
        self.storage = StructC{
            b: StructB{ a: StructA{x:11}, y: 22 },
            z: 33
        };
    }
}
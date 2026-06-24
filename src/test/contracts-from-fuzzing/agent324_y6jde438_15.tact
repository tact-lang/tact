struct StructA {
    a: Int;
    b: Bool;
}

struct StructB {
    x: StructA;
    y: String;
}

struct StructC {
    p: StructB;
    q: Bool;
}

contract NestedFixedStructs {
    sC: StructC;

    init() {
        self.sC = StructC{
            p: StructB{
                x: StructA{a:1,b:true},
                y: "value"
            },
            q: false
        };
    }
}
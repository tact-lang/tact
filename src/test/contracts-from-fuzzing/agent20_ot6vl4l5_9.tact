struct StructA {
    v1: Int;
    v2: Bool;
}

struct StructB {
    s: StructA;
}

struct StructC {
    q: StructB;
}

contract ThreeLayers {
    d: StructC;

    init() {
        self.d = StructC{
            q: StructB{
                s: StructA{
                    v1: 11,
                    v2: true
                }
            }
        };
    }
}
struct StructA {
    x: Int;
}

struct StructB {
    s: StructA;
}

struct StructC {
    s: StructB;
}

contract Deep3Level {
    val: StructC;

    init() {
        self.val = StructC{
            s: StructB {
                s: StructA {
                    x: 100
                }
            }
        };
    }
}
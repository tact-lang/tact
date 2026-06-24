struct StructA {
    a: Int;
}

struct StructB {
    a: StructA;
}

struct StructC {
    b: StructB;
}

struct StructD {
    c: StructC;
}

contract DeepStructs {
    val: StructD;

    init() {
        self.val = StructD{
            c: StructC{
                b: StructB{
                    a: StructA{ a: 101 }
                }
            }
        };
    }
}

struct StructA {
    f: Bool;
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

struct StructE {
    d: StructD;
}

contract ManyNestedLevels {
    val: StructE;

    init() {
        self.val = StructE{
            d: StructD{
                c: StructC{
                    b: StructB{
                        a: StructA{ f: true }
                    }
                }
            }
        };
    }
}
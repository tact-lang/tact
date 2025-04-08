struct StructA {
    b: StructB;
}

struct StructB {
    c: StructC;
}

struct StructC {
    d: StructD;
}

struct StructD {
    e: StructE;
}

struct StructE {
    value: Int;
}

contract TestContract {
    data: StructA;

    init() {
        self.data = StructA{
            b: StructB{
                c: StructC{
                    d: StructD{
                        e: StructE{
                            value: 42
                        }
                    }
                }
            }
        };
    }
}
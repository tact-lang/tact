struct StructA {
    x: Int;
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

contract TestContract {
    deep: StructE;

    init() {
        self.deep = StructE{
            d: StructD{
                c: StructC{
                    b: StructB{
                        a: StructA{
                            x: 777
                        }
                    }
                }
            }
        };
    }
}
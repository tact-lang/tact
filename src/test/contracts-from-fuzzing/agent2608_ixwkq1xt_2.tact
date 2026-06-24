struct NestedA {
    intA: Int;
    b: NestedB;
}

struct NestedB {
    intB: Int;
    c: NestedC;
}

struct NestedC {
    intC: Int;
    d: NestedD;
}

struct NestedD {
    intD: Int;
}

contract TestContract {
    data: NestedA;

    init() {
        self.data = NestedA{
            intA: 1,
            b: NestedB{
                intB: 2,
                c: NestedC{
                    intC: 3,
                    d: NestedD{
                        intD: 4
                    }
                }
            }
        };
    }
}

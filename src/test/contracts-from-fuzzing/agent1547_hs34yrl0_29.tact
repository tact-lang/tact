struct Strct {
    intVal: Int;
    inner1: S1;
    inner2: S2;
}

struct S1 {
    optInt: Int?;
    optBool: Bool?;
}

struct S2 {
    optStr: String?;
    flag: Bool;
}

contract ComplexMix {
    storage: Strct;
    init() {
        self.storage = Strct{
            intVal:0,
            inner1: S1{
                optInt: null,
                optBool: true
            },
            inner2: S2{
                optStr: null,
                flag: false
            }
        };
    }
}
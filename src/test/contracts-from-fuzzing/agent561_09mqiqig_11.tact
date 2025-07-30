struct InnerStruct {
    a: Int;
    b: String;
}

struct OuterStruct {
    inn1: InnerStruct;
    inn2: InnerStruct;
    flag: Bool;
}

contract Test {
    rec: OuterStruct;

    init() {
        self.rec = OuterStruct{
            inn1: InnerStruct{ a: 1, b: "abc" },
            inn2: InnerStruct{ a: 2, b: "def" },
            flag: true,
        };
    }
}
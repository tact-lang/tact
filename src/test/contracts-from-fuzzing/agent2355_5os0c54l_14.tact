struct NestedStruct {
    a: StructA;
    b: StructB;
}

struct StructA {
    val: Int;
}

struct StructB {
    val: Bool;
    nested: StructC;
}

struct StructC {
    str: String;
    opt: Int?;
}

contract Combo {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            a: StructA{ val: 42 },
            b: StructB{
                val: true,
                nested: StructC{ str: "hi", opt: null }
            }
        };
    }
}
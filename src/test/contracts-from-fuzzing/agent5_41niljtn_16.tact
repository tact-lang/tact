struct StructA {
    f1: Int;
}

struct StructB {
    f2: Bool;
    nested: StructA;
}

struct StructC {
    f3: String;
    nestedB: StructB;
}

contract DeepStruct {
    val: StructC;

    init() {
        self.val = StructC{
            f3: "x",
            nestedB: StructB{
                f2: true,
                nested: StructA{f1: 7}
            }
        };
    }
}
struct StructA {
    a: Int;
}

struct StructB {
    b: Bool;
    nested: StructA;
}

struct StructC {
    c: String;
    nestedB: StructB;
}

contract DeepChain {
    deep: StructC;

    init() {
        self.deep = StructC{
            c: "hello",
            nestedB: StructB{
                b:true,
                nested: StructA{a:1}
            }
        };
    }
}

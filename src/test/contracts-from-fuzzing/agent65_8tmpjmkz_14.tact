struct StructC {
    val: Int = 7;
    flag: Bool?;
}

struct StructB {
    nested: StructC;
    name: String = "Bob";
}

struct StructA {
    nested: StructB;
    count: Int?;
}

contract DeepChain {
    state: StructA;

    init() {
        self.state = StructA{
            nested: StructB{
                nested: StructC{val: 42, flag: null},
                name: "Alice"
            },
            count: null
        };
    }
}
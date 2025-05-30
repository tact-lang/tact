struct EmbedA {
    foo: Int;
}

struct EmbedB {
    bar: String; 
}

contract ContractChain {
    a: EmbedA;
    b: EmbedB;

    init() {
        self.a = EmbedA{ foo: 12 };
        self.b = EmbedB{ bar: "stuff" };
    }
}

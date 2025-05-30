struct StructChain {
    a: Int;
}
struct StructHolder1 {
    next: StructChain;
}
struct StructHolder2 {
    next: StructHolder1;
}
struct StructHolder3 {
    next: StructHolder2;
}
contract ChainNestedStructs {
    chain: StructHolder3;
    init() {
        self.chain = StructHolder3{
            next: StructHolder2{
                next: StructHolder1{
                    next: StructChain{
                        a: 123
                    }
                }
            }
        };
    }
}
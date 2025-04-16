struct Layer3 {
    x: Int;
}

struct Layer2 {
    inner: Layer3;
}

struct Layer1 {
    nested: Layer2;
}

contract StructChainWithDefaults {
    chain: Layer1;

    init() {
        self.chain = Layer1{
            nested: Layer2{
                inner: Layer3{ x: 99 }
            }
        };
    }
}
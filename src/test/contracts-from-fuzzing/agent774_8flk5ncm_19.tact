struct Layer1 {
    a: Int;
    layer2: Layer2?;
}

struct Layer2 {
    b: Bool;
    layer3: Layer3?;
}

struct Layer3 {
    c: String;
}

contract OptionalChain {
    chain: Layer1;
    init() {
        self.chain = Layer1{
            a: 10,
            layer2: Layer2{
                b: true,
                layer3: Layer3{ c: "end" }
            }
        };
    }
}
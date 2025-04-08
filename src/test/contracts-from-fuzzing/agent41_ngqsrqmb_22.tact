struct DeepLayer3 {
    s: String;
}

struct DeepLayer2 {
    x: DeepLayer3;
    b: Bool;
}

struct DeepLayer1 {
    y: DeepLayer2;
    addr: Address;
}

contract DeepChain {
    payload: DeepLayer1;
    init() {
        self.payload = DeepLayer1{
            y: DeepLayer2{ x: DeepLayer3{ s:"deep" }, b:true },
            addr: myAddress(),
        };
    }
}
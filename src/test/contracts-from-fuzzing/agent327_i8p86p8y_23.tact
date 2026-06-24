struct MixPrim {
    ad: Address;
    str: String;
    flag: Bool;
}

contract MultiPrimStructTest {
    mp: MixPrim;
    init() {
        self.mp = MixPrim{
            ad: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            str: "hello",
            flag: true
        };
    }
}
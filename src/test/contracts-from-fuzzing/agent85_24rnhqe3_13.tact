struct MixOpt {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract Tester {
    storage: MixOpt;
    init() {
        self.storage = MixOpt{
            a: 0,
            b: null,
            c: "",
            d: null
        };
    }
}
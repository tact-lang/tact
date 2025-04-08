struct Hybrid {
    active: Bool;
    maybeNum: Int?;
    coins: Int as coins;
    optText: String?;
    fixedText: String = "hi";
}

contract HybridStore {
    data: Hybrid;

    init() {
        self.data = Hybrid{
            active: true,
            maybeNum: null,
            coins: 500000000,
            optText: null
        };
    }
}
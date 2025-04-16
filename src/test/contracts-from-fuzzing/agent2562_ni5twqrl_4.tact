struct SOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptStructStorage {
    val: SOpt;

    init() {
        self.val = SOpt{
            a: null,
            b: true,
            c: null,
            d: "hello",
        };
    }
}
struct Data {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    s: Data;

    init() {
        self.s = Data{
            a: 42,
            b: true,
            c: "tt",
            d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        };
    }

    receive() {}
}
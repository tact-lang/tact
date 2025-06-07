struct Combination {
    i: Int;
    b: Bool?;
    s: String;
}

contract Test {
    comb: Combination;

    init() {
        self.comb = Combination{
            i: 42,
            b: null,
            s: "string"
        };
    }
}

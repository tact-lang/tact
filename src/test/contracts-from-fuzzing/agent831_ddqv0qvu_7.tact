struct Combination {
    s: String;
    n: Int;
    b: Bool;
    optStr: String?;
    optInt: Int?;
}

contract TestContract {
    combo: Combination;

    init() {
        self.combo = Combination{
            s: "test",
            n: 100,
            b: true,
            optStr: null,
            optInt: null
        };
    }
}
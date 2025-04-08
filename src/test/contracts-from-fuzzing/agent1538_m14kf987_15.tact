struct Combination {
    foo: Int;
    bar: Bool;
    baz: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    combo: Combination;

    init() {
        self.combo = Combination{
            foo: 1,
            bar: true,
            baz: "z",
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}
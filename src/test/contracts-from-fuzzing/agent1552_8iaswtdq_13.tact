struct Combination {
    i: Int;
    t: String;
    f: Bool;
    optInt: Int?;
    optBool: Bool?;
    optString: String;
}

contract VariousOptionals {
    stored: Combination;

    init() {
        self.stored = Combination{
            i: 42,
            t: "hello",
            f: true,
            optInt: null,
            optBool: false,
            optString: "world",
        };
    }
}
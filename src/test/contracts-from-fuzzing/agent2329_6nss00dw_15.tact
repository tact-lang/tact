struct DeepOpt {
    a: Int?;
    b: Bool;
}

struct OuterOpt {
    d: DeepOpt?;
    s: String;
}

contract VeryOptional {
    out: OuterOpt;

    init() {
        self.out = OuterOpt{
            d: null,
            s: "test"
        };
    }
}

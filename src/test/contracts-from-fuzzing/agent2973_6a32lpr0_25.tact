struct MixOpt {
    i: Int?;
    b: Bool;
    s: String?;
}

contract MixedOptional {
    f: MixOpt;

    init() {
        self.f = MixOpt{
            i: null,
            b: true,
            s: null
        };
    }
}
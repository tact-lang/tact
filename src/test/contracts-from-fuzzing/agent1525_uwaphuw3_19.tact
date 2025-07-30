struct OptTrail {
    a: Int;
    b: Bool?;
    c: Int?;
    d: String?;
    e: Bool?;
}

contract SkipOptionals {
    t: OptTrail;

    init() {
        self.t = OptTrail{
            a: 123
        };
    }
}
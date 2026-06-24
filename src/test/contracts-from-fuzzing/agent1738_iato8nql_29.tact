struct FullMix {
    x: Int;
    y: Int?;
    a: Bool;
    b: Bool?;
    s: String;
    t: String?;
}

contract TestContract {
    m: FullMix;

    init() {
        self.m = FullMix{
            x: 2,
            y: null,
            a: true,
            b: false,
            s: "test",
            t: "opt",
        };
    }
}
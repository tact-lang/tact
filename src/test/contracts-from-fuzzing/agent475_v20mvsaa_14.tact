struct OptionalsInside {
    a: Int?;
    b: Bool?;
}

struct MidLevel {
    inner: OptionalsInside;
    s: String;
}

contract TestContract {
    nestedOpt: MidLevel;

    init() {
        self.nestedOpt = MidLevel{
            inner: OptionalsInside{a: null, b: true},
            s: "hi"
        };
    }

    receive() {}
}
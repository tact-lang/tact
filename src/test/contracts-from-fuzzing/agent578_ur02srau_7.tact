struct Opt1 {
    x: Int?;
    y: Bool?;
}

struct Opt2 {
    a: String?;
    b: Int = 5;
}

contract OptionMix {
    f1: Opt1;
    f2: Opt2;

    init() {
        self.f1 = Opt1{ x: 123, y: true };
        self.f2 = Opt2{ a: "hi", b: 10 };
    }
}
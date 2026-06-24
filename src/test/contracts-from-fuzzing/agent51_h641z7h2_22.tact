struct Odd {
    a: Int = 1;
    b: String = "b";
}

contract X {
    odd1: Odd;
    odd2: Odd;
    bool1: Bool = true;
    int1: Int = 5;
    str1: String = "s";

    init() {
        self.odd1 = Odd{};
        self.odd2 = Odd{};
    }
}
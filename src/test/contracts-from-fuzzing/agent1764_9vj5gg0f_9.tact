struct Wide {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int = 2;
    e: Bool = false;
    f: String = "y";
    g: Int = 3;
    h: Bool = true;
    i: String = "z";
}

contract TestContract {
    big: Wide;

    init() {
        self.big = Wide{};
    }
}

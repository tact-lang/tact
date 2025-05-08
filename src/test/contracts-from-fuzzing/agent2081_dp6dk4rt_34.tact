struct Extreme {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int = 9999;
    h: Bool = true;
    i: String = "max";
    j: Int? = null;
}

contract CombinedExtreme {
    one: Extreme;
    two: Extreme;
    three: Extreme;
    init() {
        self.one = Extreme{};
        self.two = Extreme{};
        self.three = Extreme{};
    }
}
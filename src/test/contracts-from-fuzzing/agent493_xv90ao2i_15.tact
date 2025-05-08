struct BigDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Bool = true;
    f: String = "f";
    g: Bool = false;
    h: String = "h";
    i: Bool = true;
    j: Int = 10;
}

contract Defaulted {
    data: BigDefaults;

    init() {
        self.data = BigDefaults{};
    }
}
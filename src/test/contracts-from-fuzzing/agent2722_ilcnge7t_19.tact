struct LargeDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int = 7;
    h: Bool = true;
    i: String = "i";
    j: Int?;
    k: Bool?;
    l: String?;
}

contract DefaultsContract {
    data: LargeDefaults;

    init() {
        self.data = LargeDefaults {};
    }
}
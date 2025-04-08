struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Int?; // default null
    e: Bool?; // default null
}

contract DefStruct {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}
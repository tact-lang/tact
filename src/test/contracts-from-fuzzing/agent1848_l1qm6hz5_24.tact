struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultStruct {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}
struct Defaults {
    a: Int = 5;
    b: Bool = true;
    s: String = "default";
}

contract DefaultStruct {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
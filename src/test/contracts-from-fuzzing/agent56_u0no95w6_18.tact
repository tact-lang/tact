struct Defaults {
    a: Int = 1;
    b: Bool = true;
}

contract DefaultStruct {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
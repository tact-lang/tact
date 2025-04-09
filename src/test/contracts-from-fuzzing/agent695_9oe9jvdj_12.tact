struct Defaults {
    i: Int = 10;
    b: Bool = false;
    s: String = "default";
}

contract DefaultStruct {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}
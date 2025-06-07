struct Defaulted {
    x: Int = 12;
    y: Bool = true;
    s: String = "abc";
}

contract DefaultStruct {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}

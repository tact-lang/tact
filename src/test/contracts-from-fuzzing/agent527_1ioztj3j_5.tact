struct Defaulted {
    x: Int = 5;
    y: Bool = true;
    s: String = "hi";
}

contract DefaultFieldStruct {
    st: Defaulted;
    init() {
        self.st = Defaulted{};
    }
}
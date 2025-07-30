struct DefStruct {
    a: Int = 10;
    b: Bool = true;
    c: String = "x";
    d: Int?;
    e: String?;
}

contract TestContract {
    s: DefStruct;

    init() {
        self.s = DefStruct{};
    }

    receive() {}
}
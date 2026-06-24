struct DefStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "init";
}

contract Defaults {
    data: DefStruct;
    init() {
        self.data = DefStruct{};
    }
}
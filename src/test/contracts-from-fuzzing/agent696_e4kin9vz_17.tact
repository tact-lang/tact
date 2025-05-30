struct DefStruct {
    a: Int = 7;
    b: String = "def";
    c: Bool = true;
}

contract DefaultStructField {
    val: DefStruct;

    init() {
        self.val = DefStruct{};
    }
}

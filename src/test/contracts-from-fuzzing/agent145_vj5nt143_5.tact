struct DefaultStruct {
    val: Int = 0;
    flag: Bool = false;
    text: String = "default";
}

contract StructDefault {
    ds: DefaultStruct;

    init() {
        self.ds = DefaultStruct{};
    }
}

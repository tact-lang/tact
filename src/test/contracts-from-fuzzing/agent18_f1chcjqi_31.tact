struct DefaultStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract StructDefault {
    val: DefaultStruct;
    init() {
        self.val = DefaultStruct{};
    }
}
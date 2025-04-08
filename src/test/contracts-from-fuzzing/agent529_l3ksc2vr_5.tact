struct SDefault {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultStruct {
    myVar: SDefault;

    init() {
        self.myVar = SDefault{};
    }
}
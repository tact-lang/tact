struct DefaultVals {
    x: Int = 1;
    y: Bool = true;
    s: String = "abc";
}

contract DefaultStruct {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}

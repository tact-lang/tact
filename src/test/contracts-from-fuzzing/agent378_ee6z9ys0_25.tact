struct DefaultStruct {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "x";
}

contract TestContract {
    data: DefaultStruct;

    init() {
        self.data = DefaultStruct{};
    }
}
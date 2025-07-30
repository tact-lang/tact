struct DefaultStruct {
    a: Int = 0;
    b: Bool = false;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;
}

contract TestContract {
    data: DefaultStruct;

    init() {
        self.data = DefaultStruct{};
    }
}
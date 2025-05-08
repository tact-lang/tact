struct DefaultedStruct {
    a: Int = 42;
    b: Bool = true;
    c: String = "default";
}

contract DefaultStructField {
    s: DefaultedStruct;

    init() {
        self.s = DefaultedStruct{};
    }
}
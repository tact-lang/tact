struct DefaultValStruct {
    a: Int = 1;
    b: String = "default";
    c: Bool = true;
    d: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract DefaultStructField {
    s: DefaultValStruct;

    init() {
        self.s = DefaultValStruct{};
    }
}
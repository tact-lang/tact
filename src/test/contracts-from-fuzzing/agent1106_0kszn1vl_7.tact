struct DefaultFieldStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract StructWithDefaultsInState {
    st: DefaultFieldStruct;

    init() {
        self.st = DefaultFieldStruct{};
    }
}
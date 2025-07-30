struct DefaultFieldStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "x";
}

contract DefaultsStructTest {
    df: DefaultFieldStruct;

    init() {
        self.df = DefaultFieldStruct{};
    }
}
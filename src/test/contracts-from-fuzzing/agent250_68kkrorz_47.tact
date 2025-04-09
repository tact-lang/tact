struct WeirdStruct {
    a: Int?;
    b: Int = 7;
}

contract EdgeCase {
    s: WeirdStruct;

    init() {
        self.s = WeirdStruct{};
    }
}
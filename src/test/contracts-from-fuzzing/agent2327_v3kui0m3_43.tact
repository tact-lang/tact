struct DefaultNullStruct {
    a: Int?;
    b: String?;
}

contract DefNullTest {
    s: DefaultNullStruct;

    init() {
        self.s = DefaultNullStruct{};
    }
}

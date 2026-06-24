struct DefaultStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int?;
    e: String?;
}

contract StructDefaultTest {
    s: DefaultStruct;
    init() {
        self.s = DefaultStruct{
            d: null,
            e: null
        };
    }
}

struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TrailingCommaTest {
    val: OptStruct;

    init() {
        self.val = OptStruct{
            a: 42,
            b: null,
            c: "ok",
        };
    }
}
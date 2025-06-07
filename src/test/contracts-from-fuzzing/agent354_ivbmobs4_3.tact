struct OptionalStruct {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptNestedTest {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            s: null,
            n: 42,
            b: true
        };
    }
}
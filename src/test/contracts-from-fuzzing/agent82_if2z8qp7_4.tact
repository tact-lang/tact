struct OptTest {
    num: Int?;
    cond: Bool?;
    txt: String?;
}

contract Test {
    field: OptTest;

    init() {
        self.field = OptTest{
            num: null,
            cond: true,
            txt: "hello"
        };
    }
}
struct OptionalNest {
    inn: Int?;
    txt: String;
}

contract OptionalNestedTest {
    data: OptionalNest?;

    init() {
        self.data = OptionalNest{
            inn: 777,
            txt: "hello",
        };
    }
}
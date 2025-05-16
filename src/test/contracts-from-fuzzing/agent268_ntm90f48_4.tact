struct OptionalNestTest {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: String?;
}

contract OptFieldsContract {
    data: OptionalNestTest;

    init() {
        self.data = OptionalNestTest{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}
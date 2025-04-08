struct OptionalNest {
    flag: Bool;
    note: String?;
    id: Int?;
}

contract OptionalStructTest {
    inner: OptionalNest?;

    init() {
        self.inner = OptionalNest{
            flag: true,
            note: null,
            id: null,
        };
    }
}
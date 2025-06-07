struct OptionalNested {
    val: Int?;
    flag: Bool?;
}

contract OptTest {
    inner: OptionalNested;

    init() {
        self.inner = OptionalNested{
            val: null,
            flag: true,
        };
    }
}
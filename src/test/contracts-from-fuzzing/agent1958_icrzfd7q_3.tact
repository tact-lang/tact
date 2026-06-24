struct OptionalNest {
    inner: Int?;
}

contract OptTest {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{ inner: null };
    }
}

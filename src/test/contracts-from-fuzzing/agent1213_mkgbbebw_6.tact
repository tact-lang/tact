struct OptionalNest {
    inner: Int?;
    inner2: Bool?;
}

contract OptionalNestTest {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{ inner: null, inner2: true };
    }
}
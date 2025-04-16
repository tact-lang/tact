struct Inner {
    flag: Bool?;
    val: Int?;
}

contract OptionalNestedStructTest {
    innerField: Inner;

    init() {
        self.innerField = Inner{ flag: null, val: null };
    }
}
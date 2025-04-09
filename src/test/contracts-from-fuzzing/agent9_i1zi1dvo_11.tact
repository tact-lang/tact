struct OptionalInt {
    val: Int?;
}

contract DefaultOptionalTest {
    s: OptionalInt;
    init() {
        self.s = OptionalInt { val: null };
    }
}
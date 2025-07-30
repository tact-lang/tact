struct OptionalNested {
    val: Int;
}

contract OptNestTest {
    nestedOpt: OptionalNested?;

    init() {
        self.nestedOpt = null;
    }
}
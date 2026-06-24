struct OptionalNested {
    val1: Int;
    val2: String;
}

contract OptNestedTest {
    innerOpt: OptionalNested?;

    init() {
        self.innerOpt = OptionalNested{
            val1: 42,
            val2: "foo",
        };
    }
}
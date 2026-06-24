struct OptNested {
    foo: Int?;
    bar: String?;
}

contract OptionalTest {
    val: OptNested?;

    init() {
        self.val = OptNested{
            foo: 10,
            bar: null,
        };
    }
}
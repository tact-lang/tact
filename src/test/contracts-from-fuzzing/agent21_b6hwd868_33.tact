struct OptionalBool {
    flag: Bool?;
    val: Int;
}

contract BoolOptionalTest {
    f: OptionalBool;

    init() {
        self.f = OptionalBool{
            flag: null,
            val: 33
        };
    }
}
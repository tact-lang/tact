struct OptionalWithDefault {
    val: Int?;
}

contract OptionalWithDefaultTest {
    f: OptionalWithDefault;

    init() {
        self.f = OptionalWithDefault{ val: null };
    }
}
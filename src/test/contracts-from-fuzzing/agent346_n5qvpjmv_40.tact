struct OptionalBool {
    val: Bool?;
}

contract OptionalBoolTest {
    f: OptionalBool;

    init() {
        self.f = OptionalBool{
            val: null
        };
    }
}
struct OptionalBool {
    yes: Bool?;
    no: Bool?;
}

contract OptionalBoolStorageTest {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{
            yes: null,
            no: null,
        };
    }
}
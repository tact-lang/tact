struct OptStr {
    text: String?;
}

struct Wrapping {
    wrapped: OptStr;
    flag: Bool;
}

contract OptionalStringTest {
    storage: Wrapping;
    init() {
        self.storage = Wrapping{
            wrapped: OptStr{ text: null },
            flag: true
        };
    }
}
struct Both {
    s: String?;
    b: Bool;
}

contract OptionalStringTest {
    data: Both;

    init() {
        self.data = Both{
            s: null,
            b: true
        };
    }
}
struct MaybeText {
    s: String?;
}

contract OptionalStringTest {
    data: MaybeText;

    init() {
        self.data = MaybeText{ s: null };
    }
}
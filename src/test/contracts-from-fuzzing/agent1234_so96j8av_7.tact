contract OptionalDefaultTest {
    addr: Address?;

    init() {
        // no explicit assign; should default to null without error
    }
}
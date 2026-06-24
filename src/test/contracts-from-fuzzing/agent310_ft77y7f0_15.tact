// Optionals containing struct with `as remaining` inside
struct EmbeddedRem {
    prefix: Int as uint8;
    rest: Slice as remaining;
}

contract TestContract {
    x: EmbeddedRem?;

    init() {
        self.x = null;
    }
}

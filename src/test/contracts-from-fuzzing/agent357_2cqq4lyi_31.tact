// Optional struct with remaining slice
struct OptRem {
    payload: Slice as remaining;
}

contract OptionalRemainingField {
    data: OptRem?;

    init() {
        self.data = null;
    }
}
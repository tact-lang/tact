struct OptionalSlot {
    inner: Int? = 5;
}

contract TestOptInitVal {
    s: OptionalSlot;

    init() {
        self.s = OptionalSlot{};
    }
}
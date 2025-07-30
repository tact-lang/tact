struct Holder {
    x: Int?;
}

contract OptionalPersistentVar {
    val: Holder?;

    init() {
        self.val = null;
    }
}

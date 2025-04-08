struct OptSub {
    val: Int?;
}

contract OptionalStructInField {
    s: OptSub?;

    init() {
        self.s = null;
    }
}
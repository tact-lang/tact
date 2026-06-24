struct Param {
    x: Int;
    y: Bool;
}

contract OptionalStructInField {
    val: Param?;

    init() {
        self.val = null;
    }
}

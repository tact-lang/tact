struct OptionalStruct {
    xx: Int;
    yy: Bool;
}

contract TestContract {
    val: OptionalStruct?;
    init() {
        self.val = null;
    }
}

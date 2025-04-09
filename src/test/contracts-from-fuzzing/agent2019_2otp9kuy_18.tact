// Optional struct nested in contract
struct OptionalStruct {
    val: Int;
    flag: Bool;
}

contract OptionalStructHolder {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}
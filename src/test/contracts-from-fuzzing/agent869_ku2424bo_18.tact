struct OptionalStruct {
    val: Int;
    name: String;
}

contract OptionalStructContract {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }

    receive() {}
}

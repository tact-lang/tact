struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalInStorage {
    val: OptionalStruct?;

    init() {
        self.val = null;
    }
}
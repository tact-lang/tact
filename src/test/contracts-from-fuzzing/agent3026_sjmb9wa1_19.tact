struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptStructStorage {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}
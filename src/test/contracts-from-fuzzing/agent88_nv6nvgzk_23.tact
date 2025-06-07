struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}
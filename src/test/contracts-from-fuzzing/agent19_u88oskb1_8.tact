struct OptionalStruct {
    value: Int;
}

contract Test {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}
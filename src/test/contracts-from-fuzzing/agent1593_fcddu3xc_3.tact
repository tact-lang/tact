struct OptionalStruct {
    a: Int;
    b: Int;
}

contract TestContract {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}
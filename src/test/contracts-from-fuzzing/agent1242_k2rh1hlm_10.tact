struct OptionalStruct {
    x: Int;
}

contract TestContract {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}
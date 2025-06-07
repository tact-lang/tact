struct OptionalStruct {
    val: Int;
}

contract TestContract {
    os: OptionalStruct?;
    init() {
        self.os = null;
    }
}
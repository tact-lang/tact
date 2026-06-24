struct OptionalStruct {
    val: Int;
}

contract OptionalStructStorage {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
}
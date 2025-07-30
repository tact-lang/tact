struct OptionalStruct {
    val: Int?;
}

contract OptionalStructStorage {
    os: OptionalStruct?;

    init() {
        self.os = null;
    }
}
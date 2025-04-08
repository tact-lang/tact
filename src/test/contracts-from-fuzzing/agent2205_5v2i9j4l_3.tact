struct OptionalStruct {
    val: Int?;
}

contract OptStorage {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{val: null};
    }
}
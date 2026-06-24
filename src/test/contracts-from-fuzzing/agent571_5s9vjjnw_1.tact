struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract OptionalFields {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{a: null, b: true};
    }
}
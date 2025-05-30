struct OptionalStruct {
    val: Int?;
    flag: Bool?;
}

contract OptionalStructStorage {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            val: null,
            flag: true
        };
    }
}
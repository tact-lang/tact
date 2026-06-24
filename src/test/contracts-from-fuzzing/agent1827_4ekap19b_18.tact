struct OptionalBoolInt {
    flag: Bool?;
    num: Int?;
}

contract OptBoolIntStorage {
    data: OptionalBoolInt;

    init() {
        self.data = OptionalBoolInt{
            flag: null,
            num: null
        };
    }
}
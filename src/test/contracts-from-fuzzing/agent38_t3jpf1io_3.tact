struct OptStruct {
    value: Int?;
    flag: Bool?;
}

contract OptionalStructContract {
    info: OptStruct;

    init() {
        self.info = OptStruct{
            value: null,
            flag: true,
        };
    }
}
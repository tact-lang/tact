struct OptInStruct {
    flag: Bool;
    info: String?;
}

contract OptionalInStructContract {
    data: OptInStruct?;

    init() {
        self.data = OptInStruct{
            flag: true,
            info: null,
        };
    }
}
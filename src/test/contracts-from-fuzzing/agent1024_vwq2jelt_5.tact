struct OptionalInStruct {
    a: Int;
    b: Bool?;
    c: String?;
}

contract OptStructContract {
    info: OptionalInStruct;

    init() {
        self.info = OptionalInStruct{a: 42, b: true, c: null};
    }
}
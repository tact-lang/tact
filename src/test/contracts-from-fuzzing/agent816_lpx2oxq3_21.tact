struct OptionalInStruct {
    x: Int?;
}

contract OptionalInStructContract {
    s: OptionalInStruct;

    init() {
        self.s = OptionalInStruct{ x: null };
    }
}

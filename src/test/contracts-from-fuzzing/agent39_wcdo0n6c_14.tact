struct OptStruct {
    x: Int;
    y: Int?;
}

contract OptionalInside {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            x: 33,
            y: null
        };
    }
}
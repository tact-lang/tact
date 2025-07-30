struct FullStruct {
    number: Int;
    flag: Bool;
}

contract OptionalStructInit {
    data: FullStruct?;  // no default

    init() {
        self.data = FullStruct{
            number: 7,
            flag: true
        };
    }
}

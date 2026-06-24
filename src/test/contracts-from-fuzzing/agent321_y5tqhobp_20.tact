struct OptionalInitStruct {
    a: Int;
    b: Int?;
    c: Bool?;
}

contract DefaultOptionalInit {
    s: OptionalInitStruct;
    init() {
        self.s = OptionalInitStruct{
            a: 5,
            b: null,
            c: null,
        };
    }
}
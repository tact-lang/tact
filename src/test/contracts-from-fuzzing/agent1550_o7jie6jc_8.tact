struct DefaultOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DefaultOptionalContract {
    s: DefaultOptionalStruct;
    init() {
        self.s = DefaultOptionalStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}
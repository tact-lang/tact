struct MidOptStruct {
    a: Int;
    b: Int?;
    c: Int;
}

contract MidOptionalStruct {
    s: MidOptStruct;
    init() {
        self.s = MidOptStruct{
            a: 1,
            b: null,
            c: 2,
        };
    }
}
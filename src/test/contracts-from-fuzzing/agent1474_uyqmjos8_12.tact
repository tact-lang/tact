struct OptionalStruct {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
}

contract Test11 {
    f: OptionalStruct;
    init() {
        self.f = OptionalStruct{
            i: null,
            b: null,
            s: null,
            c: null
        };
    }
}
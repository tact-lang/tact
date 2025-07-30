struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Builder?;
    f: Slice?;
    g: String?;
}

contract TestOptional {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}
struct PrimsOptional {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
    s: String?;
}

contract ManyOptionalPrimitives {
    f: PrimsOptional;

    init() {
        self.f = PrimsOptional{
            i:null,
            b:null,
            a:null,
            c:null,
            sl:null,
            s:null
        };
    }
}
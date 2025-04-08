struct OptionalHeavy {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract OptionalHeavyContract {
    stored: OptionalHeavy;
    init() {
        self.stored = OptionalHeavy{
            a:null,b:null,c:null,d:null,e:null
        };
    }
}
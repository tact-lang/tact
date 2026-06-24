struct Combo {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: Slice?;
    f: String?;
}

contract AllOptionals {
    field: Combo;

    init() {
        self.field = Combo{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}
struct OptionalMany {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: String?;
}

contract NullsStruct {
    f: OptionalMany;

    init() {
        self.f = OptionalMany{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null
        };
    }
}
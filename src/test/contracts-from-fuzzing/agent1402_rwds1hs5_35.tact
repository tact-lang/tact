struct Optionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract OptStructs {
    x: Optionals;
    y: Optionals;

    init() {
        self.x = Optionals{ a:null,b:true,c:null,d:"s",e:null,f:emptyCell().asSlice() };
        self.y = Optionals{ a:7,b:null,c:myAddress(),d:null,e:emptyCell(),f:null };
    }
}
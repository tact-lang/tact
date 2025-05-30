struct Complex {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
}

contract ComplexPersist {
    state: Complex;

    init() {
        self.state = Complex{
            a:1,b:null,c:"x",d:null,e:myAddress(),f:null,g:emptyCell(),h:null,i:emptyCell().asSlice(),j:null
        };
    }
}

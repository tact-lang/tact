struct Opt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
}

contract Test {
    opty: Opt;

    init() {
        self.opty = Opt{a:null,b:true,c:"x",d:emptyCell(),e:myAddress(),f:emptyCell().asSlice()};
    }
}
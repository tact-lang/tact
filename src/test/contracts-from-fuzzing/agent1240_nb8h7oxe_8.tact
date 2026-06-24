struct Combo {
    ai: Int;
    ao: Int?;
    ab: Bool;
    ab2: Bool?;
    ac: Cell;
    acc: Cell?;
    ad: Address;
    ado: Address?;
    asl: Slice;
    aslo: Slice?;
    astr: String;
    astro: String?;
}

contract Mix {
    complex: Combo;
    init() {
        self.complex = Combo{
            ai:1, ao: null, ab:true, ab2:null, ac: emptyCell(),
            acc:null, ad: myAddress(), ado:null, asl: emptyCell().asSlice(),
            aslo:null, astr:"hello", astro:null
        };
    }
}
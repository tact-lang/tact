struct Nullables {
    i1: Int?;
    s1: String?;
    b1: Bool?;
    c1: Cell?;
    sl1: Slice?;
    a1: Address?;
}

contract NullablesHolder {
    n: Nullables;

    init() {
        self.n = Nullables{
            i1:null,s1:null,b1:null,c1:null,sl1:null,a1:null
        };
    }
}
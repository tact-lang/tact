struct ManyOptional {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;
    a1: Address?;
    a2: Address?;
    c1: Cell?;
    c2: Cell?;
    s1: String?;
    s2: String?;
}

contract OptFlood {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            i1:null,i2:null,b1:null,b2:null,
            a1:null,a2:null,c1:null,c2:null,s1:null,s2:null
        };
    }
}
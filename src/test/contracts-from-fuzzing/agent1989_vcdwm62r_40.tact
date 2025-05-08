struct ExplodingNested {
    s1: Int;
    s2: String;
    s3: Bool;
    s4: Cell;
    s5: Slice;
    s6: Address;
    s7: Int?;
    s8: String?;
    s9: Bool?;
    s10: Cell?;
    s11: Slice?;
    s12: Address?;
}

contract MonsterFields {
    f: ExplodingNested;

    init() {
        self.f = ExplodingNested{
            s1:1,s2:"x",s3:true,s4:emptyCell(),s5:emptyCell().asSlice(),s6:myAddress(),
            s7:null,s8:null,s9:null,s10:null,s11:null,s12:null
        };
    }
}
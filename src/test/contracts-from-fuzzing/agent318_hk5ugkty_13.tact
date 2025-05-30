struct BigOptional {
    s1: Int?;
    s2: Bool?;
    s3: Slice?;
    s4: Cell?;
    s5: String?;
    s6: Address?;
}

contract BigOptionalContract {
    f: BigOptional;

    init() {
        self.f = BigOptional{
            s1:null, s2: null, s3:null, s4:null, s5:null, s6:null
        };
    }
}
struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract MultiDefaults {
    s: MultiOpt = MultiOpt{ a:null, b:null, c:null };
    init() {
        self.s = MultiOpt{ a:5, b:true, c:myAddress() };
    }
}
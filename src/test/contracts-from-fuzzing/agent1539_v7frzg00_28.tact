struct MixOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptMixFields {
    state: MixOptional;
    init() {
        self.state = MixOptional{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}
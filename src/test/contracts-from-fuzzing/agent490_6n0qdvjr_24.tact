struct LargeOpt {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Int?; g: Int?; h: Int?; i: Int?; j: Int?;
}

contract BigOpts {
    data: LargeOpt;
    init() {
        self.data = LargeOpt{
            a:null, b:null, c:null, d:null, e:null,
            f:null, g:null, h:null, i:null, j:null
        };
    }
}
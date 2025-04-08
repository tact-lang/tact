struct WrapOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptWrap {
    w: WrapOpt;

    init() {
        self.w = WrapOpt{ a:null, b:false, c:myAddress(), d:null };
    }
}
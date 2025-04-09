struct OptInner {
    q: Int?;
    r: String?;
    s: Bool?;
}

contract OnlyOptionals {
    test: OptInner;

    init() {
        self.test = OptInner{q:null,r:null,s:null};
    }
}
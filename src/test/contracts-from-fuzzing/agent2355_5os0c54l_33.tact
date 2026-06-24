struct SOpt {
    a: Int?;
    b: Bool?;
}

contract RepeatStructOpt {
    s1: SOpt? = null;
    s2: SOpt? = null;
    s3: SOpt? = null;

    init() {
        self.s1 = SOpt{ a:1, b:true };
        self.s2 = null;
        self.s3 = SOpt{ a:5, b:false };
    }
}
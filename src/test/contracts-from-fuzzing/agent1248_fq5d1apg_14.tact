struct Wrapper {
    s1: Int?;
    s2: Int?;
    s3: Int?;
    s4: Int?;
    s5: Int?;
}

contract OptIntPacked {
    w: Wrapper;

    init() {
        self.w = Wrapper{s1:null,s2:2,s3:null,s4:4,s5:null};
    }
}

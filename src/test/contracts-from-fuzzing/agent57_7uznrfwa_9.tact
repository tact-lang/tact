struct SDeep {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
    f6: Int?;
}

contract WideOptionals {
    s1: SDeep;
    s2: SDeep;
    s3: SDeep;
    s4: SDeep;

    init() {
        self.s1 = SDeep{f1:null,f2:null,f3:null,f4:null,f5:null,f6:null};
        self.s2 = SDeep{f1:null,f2:null,f3:null,f4:null,f5:null,f6:null};
        self.s3 = SDeep{f1:null,f2:null,f3:null,f4:null,f5:null,f6:null};
        self.s4 = SDeep{f1:null,f2:null,f3:null,f4:null,f5:null,f6:null};
    }
}
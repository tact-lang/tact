struct ManyStringOptions {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
    s6: String?;
    s7: String?;
}

contract MultipleStringOpts {
    mso: ManyStringOptions;

    init() {
        self.mso = ManyStringOptions{
            s1:null, s2:null, s3:null, s4:null, s5:null, s6:null, s7:null
        };
    }
}
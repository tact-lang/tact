struct ManyOptStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract OptString5 {
    f: ManyOptStrings;

    init() {
        self.f = ManyOptStrings{
            s1:null,s2:null,s3:"x",s4:null,s5:"y"
        };
    }
}
struct ManyOptional {
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
    x5: Int?;
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
}

contract TestContract {
    mo: ManyOptional;

    init() {
        self.mo = ManyOptional {
            x1:null,x2:null,x3:null,x4:null,x5:null,
            s1:null,s2:null,s3:null,s4:null,
            b1:null,b2:null,b3:null
        };
    }
}
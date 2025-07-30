struct MultiOptional {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
}

contract ManyNullables {
    m: MultiOptional;

    init() {
        self.m = MultiOptional{
            i1:null,i2:null,b1:null,b2:null,s1:null,s2:null
        };
    }
}

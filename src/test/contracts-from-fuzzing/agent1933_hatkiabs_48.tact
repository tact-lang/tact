struct Large {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int?;
    b2: Bool?;
    s2: String?;
}

contract CombineVarious {
    f: Large;
    init() {
        self.f = Large{
            i1:1,
            b1:true,
            s1:"s",
            i2:null,
            b2:null,
            s2:null,
        };
    }
}
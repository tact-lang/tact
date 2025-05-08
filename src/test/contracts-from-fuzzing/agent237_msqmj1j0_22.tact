struct ManyStringsAndBools {
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool;
    s3: String;
    b3: Bool;
}

contract MixStringsBools {
    st: ManyStringsAndBools;
    init() {
        self.st = ManyStringsAndBools{
            s1: "1", s2: "2", b1:true,b2:false,s3:"3",b3:true
        };
    }
}
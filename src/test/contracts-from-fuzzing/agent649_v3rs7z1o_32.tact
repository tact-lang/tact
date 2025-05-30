struct SBig {
    n1: Int; n2: Int; n3: Int; n4: Int; n5: Int;
    s1: String; s2: String; s3: String;
    f1: Bool; f2: Bool; f3: Bool;
}

contract BigStructTest {
    s: SBig;

    init() {
        self.s = SBig{
            n1:1, n2:2, n3:3, n4:4, n5:5,
            s1:"a", s2:"b", s3:"c",
            f1:true, f2:false, f3:true
        };
    }
}
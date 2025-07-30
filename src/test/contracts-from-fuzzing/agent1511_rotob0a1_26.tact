struct BigOne {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract ContractBig {
    big: BigOne;

    init() {
        self.big = BigOne{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            s1:"one",s2:"two",s3:"three",s4:"four",s5:"five"
        };
    }
}

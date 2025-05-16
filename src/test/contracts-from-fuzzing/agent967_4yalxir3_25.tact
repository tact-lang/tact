struct TooBig {
    big1: Int;
    big2: Int;
    big3: Int;
    big4: Int;
    big5: Int;
    big6: Int;
    big7: Int;
    big8: Int;
    big9: Int;
    big10: Int;
    big11: Int;
    big12: Int;
    big13: Int;
    big14: Int;
    big15: Int;
    big16: Int;
    big17: Int;
    big18: Int;
    big19: Int;
    big20: Int;
}

contract ReallyBigStruct {
    data: TooBig;

    init() {
        self.data = TooBig{
            big1:1, big2:2, big3:3, big4:4, big5:5,
            big6:6, big7:7, big8:8, big9:9, big10:10,
            big11:11, big12:12, big13:13, big14:14, big15:15,
            big16:16, big17:17, big18:18, big19:19, big20:20
        };
    }
}
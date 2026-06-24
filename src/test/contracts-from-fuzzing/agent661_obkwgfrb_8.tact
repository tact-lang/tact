struct LongSeq {
    f0: Int;
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
}

contract SeqContract {
    data: LongSeq;

    init() {
        self.data = LongSeq{ f0:0,f1:1,f2:2,f3:3,f4:4,f5:5 };
    }
}
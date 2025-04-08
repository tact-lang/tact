struct RepeatFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
}

contract Repetition {
    r1: RepeatFields;
    r2: RepeatFields;
    r3: RepeatFields;

    init() {
        self.r1 = RepeatFields{ f1:1,f2:2,f3:3,f4:4 };
        self.r2 = RepeatFields{ f1:5,f2:6,f3:7,f4:8 };
        self.r3 = RepeatFields{ f1:9,f2:10,f3:11,f4:12 };
    }
}
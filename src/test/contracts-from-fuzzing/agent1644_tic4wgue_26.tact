struct Deep {
    one: Int;
    two: Int;
    three: Int;
    four: Int;
    five: Int;
}

contract BigPrims {
    p1: Deep;
    p2: Deep;
    p3: Deep;
    p4: Deep;

    init() {
        self.p1 = Deep{ one:1,two:2,three:3,four:4,five:5 };
        self.p2 = Deep{ one:6,two:7,three:8,four:9,five:10 };
        self.p3 = Deep{ one:11,two:12,three:13,four:14,five:15 };
        self.p4 = Deep{ one:16,two:17,three:18,four:19,five:20 };
    }
}
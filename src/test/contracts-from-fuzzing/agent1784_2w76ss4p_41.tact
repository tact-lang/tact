struct ManyNestedSerials {
    s1: Int as uint8;
    s2: Int as coins;
    s3: Int as int64;
    s4: Int as uint16;
    o1: Int?;
    o2: Int?;
}

contract ManyNestedSerialsContract {
    rec: ManyNestedSerials;

    init() {
        self.rec = ManyNestedSerials{
            s1: 5,
            s2: ton("5"),
            s3: -5000,
            s4: 10000,
            o1: null,
            o2: -33
        };
    }
}
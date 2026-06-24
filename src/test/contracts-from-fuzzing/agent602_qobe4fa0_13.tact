struct BigRecord {
    i1: Int;
    b1: Bool;
    s1: String;
    i2: Int?;
    b2: Bool?;
    s2: String?;
    i3: Int;
    b3: Bool;
    s3: String;
    i4: Int?;
    b4: Bool?;
    s4: String?;
}

contract TestContract {
    rec: BigRecord;

    init() {
        self.rec = BigRecord{
            i1: 1, b1: false, s1: "a", i2: null, b2: null, s2: null,
            i3: 3, b3: true,  s3: "b", i4: 4,    b4:true,  s4:"c",
        };
    }
}
struct LotsOptional {
    s1: String?;
    s2: String?;
    s3: String?;
    i1: Int?;
    i2: Int?;
    i3: Int?;
    b1: Bool?;
    b2: Bool?;
}

contract LotOptionals {
    optStruct: LotsOptional?;

    init() {
        self.optStruct = null;
    }
}
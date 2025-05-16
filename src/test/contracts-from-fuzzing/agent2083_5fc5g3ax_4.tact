struct LargeStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    s1: String;
    s2: String;
    s3: String;
}

contract LotsOfFields {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            i1: 1,
            i2: 2,
            i3: 3,
            i4: 4,
            i5: 5,
            b1: true,
            b2: false,
            b3: true,
            s1: "A",
            s2: "B",
            s3: "C",
        };
    }
}

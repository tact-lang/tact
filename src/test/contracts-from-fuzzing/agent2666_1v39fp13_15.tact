struct Blob {
    longStr: String;
    tinyStr: String;
    bigNum: Int;
    smallNum: Int;
    yes: Bool;
    no: Bool;
    optStr: String?;
    optInt: Int?;
    optBool: Bool?;
}

contract HugeRecord {
    rec: Blob;

    init() {
        self.rec = Blob{
            longStr: "Very very long string just for test purposes",
            tinyStr: "hi",
            bigNum: 999999999999999,
            smallNum: 1,
            yes: true,
            no: false,
            optStr: null,
            optInt: null,
            optBool: null,
        };
    }
}
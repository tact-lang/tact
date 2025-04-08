struct Mixed {
    reqInt: Int;
    optBool: Bool?;
    reqString: String;
    optInt: Int?;
    reqBool: Bool;
    optString: String?;
}

contract Test {
    data: Mixed;

    init() {
        self.data = Mixed{
            reqInt: 7,
            optBool: null,
            reqString: "ok",
            optInt: 42,
            reqBool: true,
            optString: null
        };
    }
}
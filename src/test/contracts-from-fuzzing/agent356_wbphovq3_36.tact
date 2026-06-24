struct TestLong {
    v1: Int;
    v2: Int;
    v3: Bool;
    v4: String;
    v5: Int?;
    v6: Bool?;
    v7: String?;
    v8: Bool;
    v9: Int;
    v10: Bool;
}

contract ManyFields {
    s: TestLong;

    init() {
        self.s = TestLong{
            v1:1, v2:2, v3:true, v4:"hi", v5:null, v6:null, v7:null, v8:false, v9:9, v10:true
        };
    }
}
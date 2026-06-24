struct L {
    v1: Int;
    v2: Int;
    v3: Int;
    v4: Bool;
    v5: Bool;
    v6: String;
    v7: String?;
    v8: Bool?;
    v9: Int?;
}

contract LargeStruct {
    rec: L;

    init() {
        self.rec = L{
            v1: 1,
            v2: 2,
            v3: 3,
            v4: true,
            v5: false,
            v6: "x",
            v7: null,
            v8: null,
            v9: null
        };
    }
}
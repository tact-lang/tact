struct ManyFields {
    v1: Int;
    v2: Bool;
    v3: String;
    v4: Int;
    v5: Bool;
    v6: String;
    v7: Int;
    v8: Bool;
    v9: String;
    v10: Int;
    v11: Bool;
    v12: String;
}

contract LargeStructTest {
    record: ManyFields;

    init() {
        self.record = ManyFields{
            v1:1,v2:true,v3:"a",
            v4:2,v5:false,v6:"b",
            v7:3,v8:true,v9:"c",
            v10:4,v11:false,v12:"d"
        };
    }
}
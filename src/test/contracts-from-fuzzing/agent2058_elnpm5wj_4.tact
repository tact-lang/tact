struct Inner {
    v1: Int;
    v2: Bool;
    v3: String;
    v4: Int?;
    v5: Bool?;
    v6: String?;
    v7: Int;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{
            v1:1, v2:true, v3:"s", v4:null, v5:null, v6:null, v7:7
        };
    }
}
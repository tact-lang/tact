struct S {
    v1: Int;
    v2: String;
    v3: Bool;
    v4: Int?;
    v5: Bool?;
    v6: String?;
}

contract Test {
    data: S;

    init() {
        self.data = S{
            v1:1,
            v2:"x",
            v3:false,
            v4:null,
            v5:true,
            v6:null
        };
    }
}
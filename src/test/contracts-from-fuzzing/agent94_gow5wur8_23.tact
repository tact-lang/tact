// large struct with many nullable fields
struct BigOpt {
    v1: Int?; v2: Int?; v3: Int?; v4: Int?;
    v5: Bool; v6: Bool;
    v7: String; v8: String;
}

contract Test {
    data: BigOpt;

    init() {
        self.data = BigOpt{
            v1:null, v2:null, v3:null, v4:null,
            v5:true, v6:false,
            v7:"foo", v8:"bar",
        };
    }
}
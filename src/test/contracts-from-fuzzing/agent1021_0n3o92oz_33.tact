struct DeepField {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract DeepMixTypes {
    field: DeepField;

    init() {
        self.field = DeepField{a:1,b:null,c:true,d:null,e:"x",f:null};
    }
}
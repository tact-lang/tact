struct DeepOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
}

contract OptFields {
    storage: DeepOptional;
    init() {
        self.storage = DeepOptional{a:null,b:null,c:true,d:99};
    }
}
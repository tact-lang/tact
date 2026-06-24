struct OptionalStruct {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptStructField {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{i:null,b:true,s:null};
    }
}
struct OptStruct {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptStructField {
    val: OptStruct;

    init() {
        self.val = OptStruct{s:null,b:null,i:null};
    }
}
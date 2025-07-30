struct OptStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalFields {
    f1: OptStruct;
    f2: OptStruct?;
    f3: Bool?;
    f4: String?;

    init() {
        self.f1 = OptStruct{a:null,b:true,s:null};
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
    }
}
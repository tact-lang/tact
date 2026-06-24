struct OptStruct {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: String?;
}

contract PersOpt {
    a: Int = 1;
    b: Int?;
    c: OptStruct;

    init() {
        self.b = null;
        self.c = OptStruct{f1:null, f2:null, f3:null, f4:null};
    }
}
struct OptStruct {
    a: Int?;
    b: Bool?;
}

contract ComplexDefault {
    s: OptStruct = OptStruct{a:null, b:true};

    init() {
        self.s = OptStruct{a:55, b:null};
    }
}
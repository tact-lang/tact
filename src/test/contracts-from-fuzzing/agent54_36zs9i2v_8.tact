struct OptStruct {
    a: Int?;
    b: Bool?;
    c: Int?;
}

contract OptStructContract {
    field: OptStruct;

    init() {
        self.field = OptStruct{a:null, b:true, c:7};
    }
}
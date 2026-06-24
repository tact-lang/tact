struct OptBoolStruct {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

contract OptBoolContract {
    data: OptBoolStruct;

    init() {
        self.data = OptBoolStruct{ a:null, b:null, c:null };
    }
}
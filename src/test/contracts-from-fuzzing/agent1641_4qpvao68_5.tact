struct OptStruct {
    flag: Bool?;
    value: Int?;
    label: String?;
}

contract OptionalTest {
    opt: OptStruct = OptStruct{flag:null, value:null, label:null};

    init() {
        self.opt = OptStruct{flag:true, value:100, label:"opt"};
    }
}
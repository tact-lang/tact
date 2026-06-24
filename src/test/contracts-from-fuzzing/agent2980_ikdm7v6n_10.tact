struct OptionStruct {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
}

struct Container {
    inner1: OptionStruct;
    inner2: OptionStruct;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            inner1: OptionStruct{opt1:null,opt2:null,opt3:null},
            inner2: OptionStruct{opt1:null,opt2:null,opt3:null},
        };
    }
}
struct OptionalsInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data1: OptionalsInStruct;
    data2: OptionalsInStruct;

    init() {
        self.data1 = OptionalsInStruct{ a:1,b:true,c:"x" };
        self.data2 = OptionalsInStruct{ a:null,b:null,c:null };
    }
}
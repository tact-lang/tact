struct OptStruct {
    x: Int?;
    flag: Bool?;
}

contract JustOptionStruct {
    s: OptStruct;

    init() {
        self.s = OptStruct{
            x:null,
            flag:null
        };
    }
}
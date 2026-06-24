struct OptStruct {
    s: String?;
    i: Int?;
    flag: Bool?;
}

contract WithOptStruct {
    ps: OptStruct;

    init() {
        self.ps = OptStruct{
            s: null,
            i: 123,
            flag: null
        };
    }
}
struct OptStruct {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract Opts {
    data1: OptStruct?;
    data2: OptStruct?;

    init() {
        self.data1 = null;
        self.data2 = null;
    }
}
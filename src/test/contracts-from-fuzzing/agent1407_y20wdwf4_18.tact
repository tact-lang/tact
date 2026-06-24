struct Extra {
    flag: Bool?;
    note: String;
}

contract TestContract {
    v1: Int?;
    v2: Int;
    optStruct: Extra?;

    init() {
        self.v1 = null;
        self.v2 = 1;
        self.optStruct = null;
    }
}
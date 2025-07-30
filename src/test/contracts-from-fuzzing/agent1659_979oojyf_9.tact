struct OptStruct {
    opt1: Int?;
    opt2: Bool?;
}

contract TestContract {
    sb1: OptStruct?;
    sb2: OptStruct?;

    init() {
        self.sb1 = null;
        self.sb2 = null;
    }
}
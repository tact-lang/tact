struct OptionalStruct {
    val1: Int?;
    val2: String?;
    val3: Bool?;
}

contract TestContract {
    s_opt: OptionalStruct?;

    init() {
        self.s_opt = OptionalStruct{ val1:null, val2:null, val3:true };
    }
}
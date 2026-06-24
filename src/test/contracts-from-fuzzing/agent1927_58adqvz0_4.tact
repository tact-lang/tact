struct OptionalStruct {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptionalTest {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{ val1: null, val2: null, val3: null };
    }
}
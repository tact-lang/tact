struct OptStruct {
    val1: Int?;
    val2: Bool?;
    txt: String?;
}

contract OptNestedTest {
    field: OptStruct;
    init() {
        self.field = OptStruct{ val1: null, val2: true, txt: null };
    }
}
struct OptionalWithDefaults {
    label: String = "ok";
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract OptDefaultTest {
    val: OptionalWithDefaults;

    init() {
        self.val = OptionalWithDefaults{ optInt:null, optStr:null, optBool:null };
    }
}
struct SDefaultOpt {
    optInt: Int?;
    optBool: Bool? = null;
    optStr: String? = null;
}

contract SDefaultOptTest {
    sdo: SDefaultOpt;
    init() {
        self.sdo = SDefaultOpt{
            optInt: null
        };
    }
}
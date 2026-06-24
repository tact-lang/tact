// Verify combined optional, defaulted and required contract fields
contract MixedFields {
    req: Int;
    opt: Bool?;
    def: String = "hello";
    optDef: Int? = null;

    init() {
        self.req = 5;
        self.opt = null;
        self.optDef = null;
    }

    receive() {
        self.req = 10;
        self.opt = true;
        self.def = "world";
        self.optDef = 1;
    }
}
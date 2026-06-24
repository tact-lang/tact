struct StrTest {
    s: String;
    sOpt: String?;
}

contract ContractWithStrings {
    storage: StrTest;
    init() {
        self.storage = StrTest{
            s: "test",
            sOpt: null
        };
    }
}
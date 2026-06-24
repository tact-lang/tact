struct OptionBoolStr {
    a: Int?;
    b: Bool?;
    c: String?;
}
contract OptBoolStrTest {
    f: OptionBoolStr;
    init() {
        self.f = OptionBoolStr{a:null,b:true,c:"str"};
    }
}
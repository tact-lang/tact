struct OptionalsZeroDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptDefaultsTest {
    data: OptionalsZeroDefaults;

    init() {
        self.data = OptionalsZeroDefaults{a:null,b:null,c:null};
    }
}

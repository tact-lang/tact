struct OptionalsAndDefaults {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int = 123;
    e: Bool = false;
    f: String = "qqq";
}

contract TestContract {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{
            a:null,
            b:null,
            c:null,
            d:124,
            e:true,
            f:"zzz"
        };
    }
}
struct OptionalsAndDefaults {
    a: Int?;
    b: Int = 3;
    c: Bool?;
    d: String = "hi";
}

contract ComboDefaults {
    s: OptionalsAndDefaults;

    init() {
        self.s = OptionalsAndDefaults{a:null,b:5,c:null,d:"hey"};
    }
}
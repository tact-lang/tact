struct OptionalsAndDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 5;
    e: Bool = false;
    f: String = "x";
}
contract MixOptDefaultContract {
    val: OptionalsAndDefaults;
    init() {
        self.val = OptionalsAndDefaults{
            a:null,b:null,c:null
        };
    }
}
struct DeepDefaults {
    a:Int = 1;
    b:Bool = true;
    c:String = "abc";
    d:Int?;
    e:String?;
}

contract Test {
    s: DeepDefaults;

    init() {
        self.s = DeepDefaults{};
    }
}
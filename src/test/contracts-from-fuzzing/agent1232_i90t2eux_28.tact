struct DeepDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "X";
}

struct DeepWrap {
    inner: DeepDefault;
}

contract DeepDefaults {
    dd: DeepWrap;

    init() {
        self.dd = DeepWrap{ inner: DeepDefault{} };
    }
}
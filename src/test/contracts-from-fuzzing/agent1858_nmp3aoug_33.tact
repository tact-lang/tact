struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: InnerDefaultDeep;
}

struct InnerDefaultDeep {
    x: Int = 4;
    y: Bool = true;
}

contract DeepDefaultTest {
    v: DeepDefaults;
    init() {
        self.v = DeepDefaults{
            d: InnerDefaultDeep{}
        };
    }
}
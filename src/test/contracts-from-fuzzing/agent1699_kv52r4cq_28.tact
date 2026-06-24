struct InnerD {
    foo: Int? = 7;
    bar: Bool = true;
}

struct OuterD {
    a: InnerD? = null;
    b: Int? = 100;
    c: Bool = false;
}

contract DeepDefaults {
    val: OuterD;

    init() {
        self.val = OuterD{};
    }
}
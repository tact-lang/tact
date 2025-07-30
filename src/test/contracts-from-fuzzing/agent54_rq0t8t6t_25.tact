struct DeepDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";
}

struct MiddleDefaults {
    deep: DeepDefaults;
    opt: Int? = null;
}

struct TopDefaults {
    mid: MiddleDefaults;
    str: String = "top";
}

contract DeepDefaultsContract {
    field: TopDefaults;

    init() {
        self.field = TopDefaults{
            mid: MiddleDefaults{ deep: DeepDefaults{} }
        };
    }
}
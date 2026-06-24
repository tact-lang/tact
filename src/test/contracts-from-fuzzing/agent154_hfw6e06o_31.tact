struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: DeeperDefaults;
}

struct DeeperDefaults {
    x: Int = 7;
    y: Bool = true;
}

contract DeepDefaultsContract {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{
            c: DeeperDefaults{}
        };
    }
}
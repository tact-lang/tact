struct DeepDefaults {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
}

struct Holder {
    val: DeepDefaults;
}

contract DefaultInStruct {
    data: Holder;

    init() {
        self.data = Holder{ val: DeepDefaults{} };
    }
}

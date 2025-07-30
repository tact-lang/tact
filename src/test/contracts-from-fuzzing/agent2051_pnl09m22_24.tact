struct DeepDefault {
    x: Int = 7;
    y: Bool = true;
}

struct MidDefault {
    deep: DeepDefault;
}

contract NestedDefaults {
    mid: MidDefault;

    init() {
        self.mid = MidDefault{ deep: DeepDefault{} };
    }
}
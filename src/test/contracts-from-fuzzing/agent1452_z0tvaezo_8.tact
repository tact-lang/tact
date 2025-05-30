struct DeepDefault {
    val: Int = 5;
}

struct MiddleDefault {
    deep: DeepDefault = DeepDefault{};
}

struct OuterDefault {
    middle: MiddleDefault = MiddleDefault{};
}

contract NestedDefaults {
    val: OuterDefault;

    init() {
        self.val = OuterDefault{};
    }
}
struct DeepDefault {
    x: Int = 42;
}

struct MidDefault {
    deep: DeepDefault = DeepDefault{};
}

contract NestedDefaultsContract {
    data: MidDefault = MidDefault{};
}
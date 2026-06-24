struct DeepNested {
    x: Int = 5;
}

struct MidNested {
    inner: DeepNested = DeepNested{};
}

struct OuterStruct {
    mid: MidNested = MidNested{};
}

contract DeepNestedStorage {
    data: OuterStruct = OuterStruct{};
    init() {}
}
struct DeepDefaults {
    inner: InnerWithDefs;
}
struct InnerWithDefs {
    x: Int = 12;
    y: Bool = true;
}

contract Test {
    dd: DeepDefaults = DeepDefaults{ inner: InnerWithDefs{} };
}
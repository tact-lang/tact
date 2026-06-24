struct DeepDefaults {
    sa: Int = 5;
    sb: String = "hi";
    sc: Bool = false;
}

contract DefaultNested {
    nested: DeepDefaults = DeepDefaults{};
}
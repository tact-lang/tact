struct DeepDefaults {
    a: Int = 1;
    b: Bool?;
    c: String = "d";
}

contract DeepDefaultUsage {
    s: DeepDefaults = DeepDefaults{};
}
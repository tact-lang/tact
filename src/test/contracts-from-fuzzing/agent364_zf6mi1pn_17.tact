struct DeepDefault {
    val: Int = 42;
    text: String = "hi";
    flag: Bool = true;
}

contract WithDefaults {
    f: DeepDefault;
    
    init() {
        self.f = DeepDefault{};
    }
}
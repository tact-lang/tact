struct EmptyStringDef {
    s1: String = "";
    s2: String = "hi";
}

contract EmptyStringDefaults {
    data: EmptyStringDef;
    init() {
        self.data = EmptyStringDef{};
    }
}
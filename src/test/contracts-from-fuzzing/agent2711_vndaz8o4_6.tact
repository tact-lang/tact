contract DefaultsAndInit {
    field1: Int = 7;
    field2: Bool;
    field3: String = "default";

    init() {
        self.field2 = true;
        self.field3 = "overwritten";
    }
}
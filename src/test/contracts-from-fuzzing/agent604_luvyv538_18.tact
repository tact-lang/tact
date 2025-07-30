struct MultiDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: String?;
}

contract MultiDefaultsStruct {
    val: MultiDefaults;

    init() {
        self.val = MultiDefaults{ };
    }
}
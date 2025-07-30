struct LargeFieldDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
}

contract DefaultsInStruct {
    val: LargeFieldDefaults;

    init() {
        self.val = LargeFieldDefaults{};
    }
}
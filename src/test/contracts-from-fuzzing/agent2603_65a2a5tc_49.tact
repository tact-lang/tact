struct NestedDefaults {
    a: Int = 1;
    b: Int = 2;
}

contract StructWithDefaults {
    val: NestedDefaults;
    init() {
        self.val = NestedDefaults{a:3,b:4};
    }
}

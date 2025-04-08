struct StructDefaults {
    a: Int = 1;
    b: Int = 2;
}

contract InitOverrides {
    val: StructDefaults;

    init() {
        self.val = StructDefaults{
            a:100, b:200
        };
    }
}
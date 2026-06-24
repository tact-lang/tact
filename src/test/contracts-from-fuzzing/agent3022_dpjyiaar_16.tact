struct NestedDefaults {
    a: Int = 1;
    b: Int?;
    c: Int = 3;
}

contract DefVals {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            a: 10,
            b: null,
            c: 30
        };
    }
}

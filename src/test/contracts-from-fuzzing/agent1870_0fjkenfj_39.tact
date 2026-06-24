struct OptBoolInt {
    b: Bool?;
    i: Int?;
}

contract OptBoolIntField {
    val: OptBoolInt;
    init() {
        self.val = OptBoolInt { b: null, i: null };
    }
}
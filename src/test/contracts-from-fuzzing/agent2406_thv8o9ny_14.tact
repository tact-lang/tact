struct StructWithBoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool;
}

contract BoolDefaults {
    s: StructWithBoolDefaults;

    init() {
        self.s = StructWithBoolDefaults{ a:true, b:false, c:true };
    }
}
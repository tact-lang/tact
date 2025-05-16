struct StructWithBool {
    flag: Bool;
}

contract BoolContract {
    s: StructWithBool;

    init() {
        self.s = StructWithBool{flag: true};
    }
}
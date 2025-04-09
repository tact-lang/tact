struct StructWithBool {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract TestContract {
    data: StructWithBool;
    init() {
        self.data = StructWithBool{ flag1: true, flag2: false, flag3: true };
    }
}
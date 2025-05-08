struct SWithBool {
    flag: Bool;
}

contract Test30 {
    flag1: Bool;
    flag2: Bool = true;
    sflag: SWithBool;

    init() {
        self.flag1 = false;
        self.sflag = SWithBool{ flag: true };
    }
}

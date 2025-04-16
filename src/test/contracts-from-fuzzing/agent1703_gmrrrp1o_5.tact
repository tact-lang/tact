struct BoolConsts {
    flag1: Bool = true;
    flag2: Bool = false;
}

contract BoolConstsContract {
    flags: BoolConsts;

    init() {
        self.flags = BoolConsts{};
    }
}
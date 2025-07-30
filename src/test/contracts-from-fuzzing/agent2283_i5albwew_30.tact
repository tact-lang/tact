struct BoolSerialize {
    flag1: Bool;
    flag2: Bool;
}

contract BoolSerializeContract {
    flags: BoolSerialize;

    init() {
        self.flags = BoolSerialize{flag1: true, flag2: false};
    }
}

struct EmbeddedBool {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
}

contract PackedBits {
    flags: EmbeddedBool;
    init() {
        self.flags = EmbeddedBool{ flag1: true, flag2: false, flag3: true, flag4: false };
    }
}
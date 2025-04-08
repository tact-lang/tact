struct HasBool {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract PackedBitsTest {
    data: HasBool;

    init() {
        self.data = HasBool{ flag1: true, flag2: false, flag3: true };
    }
}
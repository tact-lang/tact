struct HasFlags {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract StructOfFlags {
    flags: HasFlags;

    init() {
        self.flags = HasFlags{ flag1: true, flag2: false, flag3: true };
    }
}
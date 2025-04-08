struct BoolNest {
    flag: Bool;
    nested: Bool?;
}

contract BoolStructs {
    flags: BoolNest;

    init() {
        self.flags = BoolNest{ flag: false, nested: null };
    }
}
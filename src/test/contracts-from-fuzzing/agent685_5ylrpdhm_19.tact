struct SFlag {
    flag: Bool;
}

contract StructOfStruct {
    inner: SFlag;

    init() {
        self.inner = SFlag{ flag: true };
    }
}
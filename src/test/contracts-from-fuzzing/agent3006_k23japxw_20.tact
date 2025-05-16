struct InnerOverride {
    val: Int;
}

contract InitAndDefaultStructs {
    s: InnerOverride = InnerOverride{val: 1};

    init() {
        self.s = InnerOverride{val: 99};
    }
}

struct OneLevel {
    f1: Int;
    f2: Bool;
    f3: Address;
}

struct TwoLevel {
    inner: OneLevel;
}

contract NestedSimple {
    val: TwoLevel;
    init() {
        self.val = TwoLevel{ inner: OneLevel{ f1: 1, f2: true, f3: myAddress() } };
    }
}

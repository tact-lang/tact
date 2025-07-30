struct Cont {
    flag: Bool;
    inner: Int?;
}

contract NestedOptionalPersists {
    val: Cont?;

    init() {
        self.val = Cont{ flag: true, inner: null };
    }
}
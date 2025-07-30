struct SOpt {
    s: String?;
}

contract OptionalStringDefault {
    val: SOpt;

    init() {
        self.val = SOpt{ s: null };
    }
}
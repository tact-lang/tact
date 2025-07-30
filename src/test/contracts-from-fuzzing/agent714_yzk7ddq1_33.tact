struct SOpt {
    a: Int?;
}

contract OptAssign {
    val: SOpt;

    init() {
        self.val = SOpt{ a: null };
    }
}
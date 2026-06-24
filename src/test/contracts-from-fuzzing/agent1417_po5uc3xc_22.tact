struct Wrap {
    data: Int;
}

contract MultiAssignment {
    val1: Wrap;
    val2: Wrap;
    init() {
        let tmp = Wrap{ data: 123 };
        self.val1 = tmp;
        self.val2 = tmp;
    }
}
struct SVal {
    f1: Int;
    f2: String;
}

contract DefaultAndAssign {
    val: SVal = SVal{ f1: 5, f2: "abc" };
    init() {
        self.val = SVal{ f1: 10, f2: "def" };
    }
}

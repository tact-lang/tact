struct SOpt {
    n: Int?;
}

contract OptStructInContract {
    val: SOpt?;
    init() {
        self.val = null;
    }
}
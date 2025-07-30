struct Extra {
    c: Cell?;
    s: String?;
}

contract TestContract {
    addr: Address?;
    val: Int;
    ex: Extra?;

    init() {
        self.addr = null;
        self.val = 42;
        self.ex = null;
    }
}
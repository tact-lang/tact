struct Ret {
    amount: Int as coins;
    label: String;
}

contract RetTest {
    st: Ret;

    init() {
        self.st = Ret{amount: ton("1"), label: "One Coin"};
    }
}

const MONEY: Int = ton("1");

contract TestTonConstant {
    receive() {
        let money: Int = MONEY;
    }
}

const CONST_TON: Int = ton("1");

contract TestTonConst {
    receive() {
        let value = CONST_TON;
    }
}

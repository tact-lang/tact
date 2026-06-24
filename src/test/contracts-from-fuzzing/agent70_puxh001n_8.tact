const coinValue: Int = ton("1.1");

contract ConstantTonTest {
    get fun getCoinValue(): Int {
        return coinValue;
    }
}

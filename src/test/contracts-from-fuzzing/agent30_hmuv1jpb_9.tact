const NANO: Int = ton("0.000000001");

contract TestTonConstant {
    get fun getNano(): Int {
        return NANO;
    }
}

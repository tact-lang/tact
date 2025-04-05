const SUM: Int = 40 + 2;
const PROD: Int = 6 * 7;

contract Test {
    get fun getSum(): Int {
        return SUM;
    }
    
    get fun getProd(): Int {
        return PROD;
    }
}

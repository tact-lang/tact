const GLOBAL_CONSTANT: Int = 100;

contract Test1 {
    get fun getConstant(): Int {
        return GLOBAL_CONSTANT;
    }
}

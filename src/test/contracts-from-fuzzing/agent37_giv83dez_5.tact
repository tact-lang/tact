const GlobalConst: Int = 123;

contract TestConstant {
    get fun getGlobal(): Int {
        return GlobalConst;
    }
}

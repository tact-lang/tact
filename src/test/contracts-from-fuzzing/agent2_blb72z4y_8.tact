const GLOBAL_CONST: Int = 100;

contract TestGlobalConst {
    get fun getGlobal(): Int {
        return GLOBAL_CONST;
    }
}

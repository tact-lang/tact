const GLOBAL_CONST: Int = 100 + 23;

contract Test {
    get fun getGlobal(): Int {
         return GLOBAL_CONST;
    }
}

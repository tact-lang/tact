const GLOBAL_CONST: Int = 42;

contract Test1 {
    get fun getConst(): Int {
         return GLOBAL_CONST;
    }
}

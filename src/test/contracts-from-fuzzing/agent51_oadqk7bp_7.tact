const GLOBAL_CONST: Int = 1000 + 42;

contract Test2 {
    get fun getConst() : Int {
         return GLOBAL_CONST;
    }
}

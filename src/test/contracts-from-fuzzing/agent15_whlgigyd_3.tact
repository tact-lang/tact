const GLOBAL_CONST: Int = 42;

contract TestGlobal {
    get fun getValue(): Int {
        return GLOBAL_CONST;
    }
}

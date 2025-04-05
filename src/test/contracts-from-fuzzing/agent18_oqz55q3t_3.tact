const CONST_INT: Int = 42;

contract Test1 {
    receive() {
        dump(CONST_INT);
    }
}

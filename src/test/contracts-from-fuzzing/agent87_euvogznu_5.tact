const CONST_INT: Int = 2 + 3 * 4;

contract Test2 {
    receive() {
        let x: Int = CONST_INT;
    }
}

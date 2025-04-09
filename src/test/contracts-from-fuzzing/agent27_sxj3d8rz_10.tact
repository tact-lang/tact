asm fun depth(): Int { DEPTH }

contract AsmTest {
    receive() {
        dump(depth());
    }
}

asm fun depth(): Int { DEPTH }

contract AsmTest2 {
    receive() {
        dump(depth());
    }
}

asm fun asmMyCode(): Cell { MYCODE }

contract Test {
    receive() {
        let c = asmMyCode();
        dump(c);
    }
}

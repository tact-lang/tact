asm fun answer(): Int { 42 INT }

contract TestAsm {
    receive() {
        dump(answer());
    }
}

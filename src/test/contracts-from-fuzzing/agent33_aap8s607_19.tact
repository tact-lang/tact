asm fun answer(): Int { 42 INT }

contract TestAsmCall {
    receive() {
        // Call assembly function; expected to return 42
        let result: Int = answer();
    }
}

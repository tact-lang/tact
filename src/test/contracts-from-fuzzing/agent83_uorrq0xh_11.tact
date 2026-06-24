asm fun asm_ret(): Int { PUSHINT 10; }

contract AssemblyReturnTest {
    // Function calling an assembly function that returns an Int
    fun test_asm(): Int {
        return asm_ret();
    }

    // Function combining assembly and regular return
    fun mixed_return(flag: Bool): Int {
        if (flag) {
            return asm_ret();
        } else {
            return 20;
        }
    }
}

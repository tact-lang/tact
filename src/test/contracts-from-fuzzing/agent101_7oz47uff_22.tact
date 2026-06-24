asm fun asmAdd(x: Int, y: Int): Int { x y ADD }

fun testAsm(): Int {
    return asmAdd(10, 32);
}

contract TestAsmFunction {
    receive() {}
}

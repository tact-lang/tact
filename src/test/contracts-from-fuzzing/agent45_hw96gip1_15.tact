asm(x y -> 0) fun asmAdd(x: Int, y: Int): Int { 
    ADD
}

contract TestAsmGetter {
    receive () {}

    get fun getSum(a: Int, b: Int): Int {
         return asmAdd(a, b);
    }
}

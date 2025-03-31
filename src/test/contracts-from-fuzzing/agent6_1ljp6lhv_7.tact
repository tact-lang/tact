asm fun add(a: Int, b: Int): Int {
    ADD
}

contract TestAsm {
    get fun callAdd(a: Int, b: Int): Int {
        return add(a, b);
    }
}

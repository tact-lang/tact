asm fun multiStep(a: Int): Int {
    // Duplicate the top of the stack
    DUP
    // Add the two identical values
    ADD
}

fun main() {
    multiStep(7);
}

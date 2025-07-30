struct Pair { first: Int; second: Int }

asm(-> 1 0) fun asmSwap(): Pair {
    // Push two integers onto the stack
    100 INT;
    200 INT
}

fun main() {
    let p = asmSwap();
}

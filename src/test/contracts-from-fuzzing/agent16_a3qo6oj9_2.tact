asm fun swap(a: Int, b: Int): Int {
    SWAP
}

fun main() {
    // Passing 10 and 20; after SWAP, top of stack becomes the original a, so expect 10
    let x = swap(10, 20);
}

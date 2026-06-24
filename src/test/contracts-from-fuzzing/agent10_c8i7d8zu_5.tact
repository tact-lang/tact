struct Pair {
    first: Int;
    second: Int;
}

asm(b a -> 1 0) fun swap(a: Int, b: Int): Pair {
    SWAP
}

fun main() {
    let p: Pair = swap(10, 20);
}

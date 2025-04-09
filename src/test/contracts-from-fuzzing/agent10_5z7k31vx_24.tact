struct Pair { first: Int; second: Int }

asm fun retPair(x: Int, y: Int): Pair { MINMAX }

fun testAsmRetPair() : Int {
    let p: Pair = retPair(10, 20);
    return p.first + p.second;  // Expected: 10 + 20 = 30
}

fun main() : Int {
    return testAsmRetPair();
}

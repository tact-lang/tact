/// Test: diffPair with arrangement -> 0 1

struct Pair { first: Int; second: Int }

// Using arrangement "-> 0 1"; no change after body
asm(a b -> 0 1) fun diffPair(a: Int, b: Int): Pair { SWAP }

fun main() {
    // Parameters: a=10, b=20
    // Body SWAP yields: [20, 10]
    // Return arrangement "-> 0 1" keeps order as is
    // So, Pair { first: 20, second: 10 }
    let p = diffPair(10, 20);
    // Compute difference: second - first = 10 - 20 = -10
    p.second - p.first
}

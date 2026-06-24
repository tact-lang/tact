struct Pair { first: Int; second: Int }

// Test 3: Assembly function with argument and return arrangement to swap two integers
asm(a b -> 1 0) fun swapInts(a: Int, b: Int): Pair {}

fun main() {
    let p = swapInts(10, 20);
    // p.first should capture the original second parameter (20)
    // p.second should capture the original first parameter (10)
}
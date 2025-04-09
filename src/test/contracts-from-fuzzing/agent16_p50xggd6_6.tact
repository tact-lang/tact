struct Pair { a: Int; b: Int; }

// Test 7: Multiple return paths with structure return
fun returnPair(flag: Bool): Pair {
    if (flag) {
        return Pair{a: 1, b: 2};
    } else {
        return Pair{a: 3, b: 4};
    }
}

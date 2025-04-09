/*
  Additional Map Fuzz Tests: Testing subtle edge cases and non-obvious behaviors.
  This snippet explores:
  - Order-insensitive equality: Inserting the same key-value pairs in a different order
    for shallow equality (==) and deep equality (deepEquals).
  - Using large integer values (to test boundaries on Int keys) in maps.
  - Overwriting a key multiple times and testing replaceGet behavior.
  - Repeated deletion to test idempotence of deletion operations.
*/

fun testOrderEquality() {
    // Create two maps with same entries but inserted in different order.
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(1, 10);
    m1.set(2, 20);
    m2.set(2, 20);
    m2.set(1, 10);
    dump(m1 == m2);          // Shallow equality result (true if canonical serialization, might be false otherwise)
    dump(m1.deepEquals(m2)); // Deep equality expected to be true
}

fun testBigInts() {
    // Testing with large integer keys. Although Tact uses 257-bit ints, we test with representative large numbers.
    let m: map<Int, Int> = emptyMap();
    // Arbitrarily chosen large numbers
    let large1: Int = 123456789012345678901234567890;
    let large2: Int = -98765432109876543210987654321;
    m.set(large1, 111);
    m.set(large2, 222);
    dump(m.get(large1)!!); // Expected: 111
    dump(m.get(large2)!!); // Expected: 222
}

fun testOverwriteAndReplace() {
    // Test repeated overwriting and the behavior of replaceGet.
    let m: map<Int, Int> = emptyMap();
    m.set(42, 100);
    m.set(42, 200);
    dump(m.get(42)!!); // Expected: 200
    let replaced = m.replaceGet(42, 300);
    dump(replaced);     // Expected: 200
    dump(m.get(42)!!); // Expected: 300
}

fun testRepeatedDeletion() {
    // Test that deletion of a non-existent key returns false.
    let m: map<Int, Int> = emptyMap();
    m.set(7, 77);
    dump(m.del(7)); // Expected: true
    dump(m.del(7)); // Expected: false, since key 7 no longer exists
}

fun main() {
    testOrderEquality();
    testBigInts();
    testOverwriteAndReplace();
    testRepeatedDeletion();
    return;
}

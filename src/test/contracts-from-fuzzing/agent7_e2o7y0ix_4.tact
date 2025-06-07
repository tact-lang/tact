/*
  Additional Map Fuzz Tests (Continuation)
  This snippet adds more nuanced tests:
  - Testing asCell() on a non-empty map, expecting a non-null Cell
  - Testing behavior when setting a key's value multiple times to the same value
  - Testing deep equality with multiple entries inserted in different orders 
  - Additional repeated deletion tests
*/

fun testNonEmptyAsCell() {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    let c = m.asCell();
    if (c == null) {
        dump("error: cell should not be null");
    } else {
        dump("non-null cell"); // Expected output: "non-null cell"
    }
}

fun testSameValueMultipleSets() {
    let m: map<Int, Int> = emptyMap();
    m.set(5, 50);
    m.set(5, 50);
    m.set(5, 50);
    dump(m.get(5)!!); // Expected: 50
}

fun testDeepEqualityMultipleOrder() {
    // Create three maps with the same set of entries inserted in different orders
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    let m3: map<Int, Int> = emptyMap();
    
    m1.set(1, 10);
    m1.set(2, 20);
    m1.set(3, 30);

    m2.set(3, 30);
    m2.set(1, 10);
    m2.set(2, 20);

    m3.set(2, 20);
    m3.set(3, 30);
    m3.set(1, 10);

    dump(m1.deepEquals(m2)); // Expected: true
    dump(m1.deepEquals(m3)); // Expected: true
    dump(m2.deepEquals(m3)); // Expected: true
}

fun testOverwriteSameKey() {
    // Overwrite a key's value several times
    let m: map<Int, Int> = emptyMap();
    m.set(42, 100);
    m.set(42, 200);
    m.set(42, 300);
    dump(m.get(42)!!); // Expected: 300
}

fun testRepeatedDeletionAgain() {
    let m: map<Int, Int> = emptyMap();
    m.set(7, 77);
    dump(m.del(7));  // Expected: true
    dump(m.del(7));  // Expected: false
    // Attempt deletion after re-setting the value
    m.set(7, 700);
    dump(m.del(7));  // Expected: true
    dump(m.exists(7));  // Expected: false
}

fun main() {
    testNonEmptyAsCell();
    testSameValueMultipleSets();
    testDeepEqualityMultipleOrder();
    testOverwriteSameKey();
    testRepeatedDeletionAgain();
    return;
}

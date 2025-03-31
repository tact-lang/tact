fun mapOperationsTest(): Int {
    // Create an empty map from Int to Int
    let m: map<Int, Int> = emptyMap();
    // Initially, it should be empty
    let emptyScore = m.isEmpty() ? 1 : 0;  // expect 1 because map is empty

    // Set a key-value pair
    m.set(7, 70);
    // After setting, exists(7) should be true (value exists)
    let existsScore = m.exists(7) ? 10 : 0;  // expect 10

    // Retrieve the value; atomic access using !!
    let val7 = m.get(7)!!;  // expect 70

    // Test replacement: change key 7's value from 70 to 68
    let replacedScore = m.replace(7, 68) ? 100 : 0; // replacement should succeed (true => 100)

    // Now remove the key by replacing value with null
    let removedScore = m.replace(7, null) ? 1000 : 0; // key 7 removed, expect true => 1000

    // Sum up all scores to produce a final value
    return emptyScore + existsScore + val7 + replacedScore + removedScore;
}

fun deepEqualsTest(): Int {
    // Create two maps with identical content
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(1, 10);
    m1.set(2, 20);
    m2.set(1, 10);
    m2.set(2, 20);

    // deepEquals should return true
    let equalsFlag = m1.deepEquals(m2);
    return equalsFlag ? 555 : 0;
}

fun optionalTest(): Int {
    // Test optional variable and non-null assertion operator
    let opt: Int? = 42;
    let finalVal = (opt != null) ? opt!! * 2 : 0; // expected 84
    return finalVal;
}

fun main() {
    dump(mapOperationsTest()); // compute a score based on map operations
    dump(deepEqualsTest());
    dump(optionalTest());
}

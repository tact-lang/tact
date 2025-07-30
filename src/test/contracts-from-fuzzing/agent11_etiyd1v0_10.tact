/*
Comprehensive Map Fuzz-Testing Suite

This code snippet tests a variety of map (dictionary) features in Tact, including:
  - Shallow equality using the "==" operator
  - Deep equality using the deepEquals() method
  - Replacement of map entries (both updating and deletion via replace with null)
  - Serialization modifiers for map keys/values (using serialized map keys)
  - Nested maps: embedding a map inside a struct and accessing nested values

Each function is designed to test a subtle edge case in map behavior, verifying that the compiler adheres to the documented behavior.
*/

// Test shallow equality using the equality operator (==)
fun testEqualityOperator() : Bool {
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(1, 42);
    m2.set(1, 42);
    // The equality operator compares underlying cell hashes
    return m1 == m2;
}

// Test deep equality using the deepEquals() method
fun testDeepEquality() : Bool {
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(5, 55);
    m2.set(5, 55);
    return m1.deepEquals(m2);
}

// Test replacing a value successfully
fun testReplace() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(3, 300);
    let rep: Bool = m.replace(3, 350);
    // If replacement is successful, the new value should be 350
    if (rep) {
        return m.get(3)!! == 350;
    } else {
        return false;
    }
}

// Test replacing a value with null (deletion)
fun testReplaceDeletion() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(10, 100);
    let rep: Bool = m.replace(10, null);
    // On successful deletion, get(10) returns null
    return rep && m.get(10) == null;
}

// A struct using a serialized map: keys and values are compacted as 8-bit unsigned integers
struct SerializedMap {
    compact: map<Int as uint8, Int as uint8>
}

// Test that the serialized map works as expected
fun testSerializedMap() : Int {
    let sm: SerializedMap = SerializedMap { compact: emptyMap() };
    sm.compact.set(2, 100);
    // Retrieve the value associated with key 2
    return sm.compact.get(2)!!;
}

// A struct for nested maps: the value is itself a struct containing a map
struct AllowanceMap {
    unbox: map<Address, Int>
}

// Test nested maps by setting a value in an inner map and retrieving it
fun testNestedMap() : Int {
    let allowances: map<Address, AllowanceMap> = emptyMap();
    let allowance: AllowanceMap = AllowanceMap { unbox: emptyMap() };
    // Set a value in the nested map; myAddress() is assumed to return the current contract's address
    allowance.unbox.set(myAddress(), 999);
    allowances.set(myAddress(), allowance);
    return allowances.get(myAddress())!!.unbox.get(myAddress())!!;
}

/*
To run these tests, one can invoke the functions individually in a testing environment.
For example, using a script that calls testEqualityOperator(), testDeepEquality(), etc., and verifies their outputs.
*/

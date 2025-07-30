// Fuzzing tests for Tact maps:

// Test 1: Basic map with Int keys and Int values.
// Documentation reference: Allowed key types in maps (maps docs, e.g.,  )
fun test_map_int_int() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 101);
    m.set(2, 202);
    return m.get(1)!! + m.get(2)!!;
}

// Test 2: Map with Int keys and Bool values. Allowed as per docs (allowed types: Bool is allowed as value).
fun test_map_int_bool() : Bool {
    let m: map<Int, Bool> = emptyMap();
    m.set(10, true);
    m.set(20, false);
    return m.exists(10) && (m.get(20) == false);
}

// Test 3: Deletion by setting a key's value to null.
// According to documentation, setting to null should delete the map entry (docs: replace and set null behavior  ).
fun test_set_null() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(5, 555);
    // Assigning null deletes the key from the map
    m.set(5, null);
    return m.get(5) == null;
}

// Test 4: Replace and get old value
// Reference: replaceGet behavior as described in documentation (e.g.,  )
fun test_replace_get() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(7, 700);
    let old = m.replaceGet(7, 777)!!;
    return old;
}

// Test 5: Deleting an entry using del() method
// Documentation: del() returns true if deletion occurs, false if key not found ( )
fun test_del() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(8, 800);
    let a = m.del(8);
    let b = m.del(8);
    return a && (b == false);
}

// Test 6: Nested maps
// Create a struct containing a nested map, as shown in documentation (e.g.,  )
struct InnerMap {
    data: map<Int, Int>;
}
fun test_nested() : Int {
    let inner: InnerMap = InnerMap { data: emptyMap() };
    inner.data.set(3, 300);
    return inner.data.get(3)!!;
}

// Test 7: Map with serialization formats.
// Documentation: supports serialization of Int as uint8 for compact storage ( )
struct SerializedMap {
    compact: map<Int as uint8, Int as uint8>;
}
fun test_serialized() : Int {
    let s: SerializedMap = SerializedMap { compact: emptyMap() };
    s.compact.set(1, 128);
    return s.compact.get(1)!!;
}

// Test 8: Deep equals method to compare maps
// Documentation: deepEquals provides a structural equality check ( )
fun test_deepEquals() : Bool {
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(1, 100);
    m2.set(1, 100);
    return m1.deepEquals(m2);
}

// Test 9: asCell() behavior on empty and non-empty maps
// Documentation: asCell returns null for empty maps and a valid Cell for non-empty ones ( )
fun test_asCell_empty() : Bool {
    let m: map<Int, Int> = emptyMap();
    return m.asCell() == null;
}

fun test_asCell_nonEmpty() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    return m.asCell() != null;
}

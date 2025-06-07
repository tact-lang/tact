struct InnerMap {
    data: map<Int, Int>;
}

struct SerializedMap {
    compact: map<Int as uint8, Int as uint8>;
}

fun test_map_int_int() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 101);
    m.set(2, 202);
    return m.get(1)!! + m.get(2)!!;
}

fun test_map_int_bool() : Bool {
    let m: map<Int, Bool> = emptyMap();
    m.set(10, true);
    m.set(20, false);
    return m.exists(10) && (m.get(20) == false);
}

fun test_set_null() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(5, 555);
    // Setting value to null deletes the entry
    m.set(5, null);
    return m.get(5) == null;
}

fun test_replace_get() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(7, 700);
    let old = m.replaceGet(7, 777)!!;
    return old;
}

fun test_del() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(8, 800);
    let a = m.del(8);
    let b = m.del(8);
    return a && (b == false);
}

fun test_nested() : Int {
    let inner: InnerMap = InnerMap { data: emptyMap() };
    inner.data.set(3, 300);
    return inner.data.get(3)!!;
}

fun test_serialized() : Int {
    let s: SerializedMap = SerializedMap { compact: emptyMap() };
    s.compact.set(1, 128);
    return s.compact.get(1)!!;
}

fun test_deepEquals() : Bool {
    let m1: map<Int, Int> = emptyMap();
    let m2: map<Int, Int> = emptyMap();
    m1.set(1, 100);
    m2.set(1, 100);
    return m1.deepEquals(m2);
}

fun test_asCell_empty() : Bool {
    let m: map<Int, Int> = emptyMap();
    return m.asCell() == null;
}

fun test_asCell_nonEmpty() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    return m.asCell() != null;
}

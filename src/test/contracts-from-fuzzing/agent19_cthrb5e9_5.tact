struct Inner {
    data: map<Int, Int>;
}

struct SerializedMap {
    compact: map<Int as uint8, Int as uint8>;
}

fun test_map() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 101);
    m.set(2, 202);
    return m.get(1)!! + m.get(2)!!;
}

fun test_replace() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(3, 300);
    let old = m.replaceGet(3, 333)!!;
    return old;
}

fun test_del() : Bool {
    let m: map<Int, Int> = emptyMap();
    m.set(4, 400);
    let a = m.del(4);
    let b = m.del(4);
    return a && (b == false);
}

fun test_nested() : Int {
    let inner: Inner = Inner{ data: emptyMap() };
    inner.data.set(7, 700);
    return inner.data.get(7)!!;
}

fun test_serialized() : Int {
    let s: SerializedMap = SerializedMap{ compact: emptyMap() };
    s.compact.set(1, 200);
    return s.compact.get(1)!!;
}

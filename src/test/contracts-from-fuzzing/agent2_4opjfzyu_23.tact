extends fun double(self: Int): Int { return self + self; }

struct TestSerialization {
    a: Int as varuint32;
    b: Int as varint16;
}

fun test_map(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(10, 100);
    m.set(20, 200);
    let sum: Int = 0;
    foreach (k, v in m) {
        sum = sum + k + v;
    }
    return sum; // expected 10+100 + 20+200 = 330
}

fun test_serialization(): Int {
    let s = TestSerialization { a: 100, b: 50 };
    return s.a + s.b; // expected 150
}

fun test_extension(): Int {
    return 5.double(); // expected 10
}

fun main() {
    dump(test_map());
    dump(test_serialization());
    dump(test_extension());
}

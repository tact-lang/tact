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

fun fact(n: Int): Int {
    if (n == 0) { return 1; } else { return n * fact(n - 1); }
}

fun test_fact(): Int {
    return fact(5); // expected 120
}

fun test_cell_load(): Int {
    let cell: Cell = beginCell().storeUint(123, 7).endCell();
    let s: Slice = cell.beginParse();
    let value: Int = s.loadUint(7);
    return value; // expected 123
}

fun main() {
    dump(test_map());            // expected output: 330
    dump(test_serialization());  // expected output: 150
    dump(test_extension());      // expected output: 10
    dump(test_fact());           // expected output: 120
    dump(test_cell_load());      // expected output: 123
}

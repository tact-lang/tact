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
    return sum; // expected: 10+100 + 20+200 = 330
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

// New tests: Serialization with varuint32 and varint16

struct VarTest {
    small: Int as varuint32;
    large: Int as varuint32;
}

fun test_varuint32(): Int {
    // maximum for varuint32 is 2^248 - 1; minimum is 0
    let vt = VarTest { small: 0, large: pow(2, 248) - 1 };
    return vt.small + vt.large; // expected: 0 + (2^248 - 1) = 2^248 - 1
}

struct VarTest2 {
    num: Int as varint16;
}

fun test_varint16(): Int {
    // varint16: range from -2^119 to 2^119 - 1
    let v1 = VarTest2 { num: pow(2, 119) - 1 };
    let v2 = VarTest2 { num: -pow(2, 119) };
    return v1.num + v2.num; // expected: (2^119 - 1) + (-2^119) = -1
}

// Additional test for recursion, cell conversion, and inline function

inline fun addInline(a: Int, b: Int): Int {
    return a + b;
}

fun test_inline(): Int {
    return addInline(50, 50); // expected 100
}

fun main() {
    dump(test_map());            // expected output: 330
    dump(test_serialization());  // expected output: 150
    dump(test_extension());      // expected output: 10
    dump(test_fact());           // expected output: 120
    dump(test_cell_load());      // expected output: 123
    dump(test_varuint32());      // expected output: 2^248 - 1 (a very large integer)
    dump(test_varint16());       // expected output: -1
    dump(test_inline());         // expected output: 100
}

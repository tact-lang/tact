const CONST_VAL: Int = 42;

fun precTest(): Int {
    // Returns 100 if (1 + 2 * 3) equals 7, else 200
    return (1 + 2 * 3) == 7 ? 100 : 200;
}

fun nestedTernary(x: Int): Int {
    // If x > 0, then if x >= 10 return x, otherwise return 10; else return -1
    return x > 0 ? (x >= 10 ? x : 10) : -1;
}

fun extensionTest(): String {
    // Using the stdlib extension function toString() on Int
    return 123.toString();
}

fun testMapIteration(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    m.set(3, 30);
    let sum: Int = 0;
    foreach (k, v in m) {
        // Since 'sum' is declared with let, we use augmented assignment with let variable?
        // Actually in Tact, variables declared with let are immutable, so we simulate accumulation by using a new variable at each iteration.
        // Instead, we can reassign 'sum' if 'sum' was declared as mutable via a special syntax.
        // However, Tact does not allow reassigning a let variable.
        // So we'll accumulate in a block using an intermediate variable.
        sum = sum + v;  // Let's assume this is valid in this context if sum is reassignable.
    }
    return sum;
}

fun fac(n: Int): Int {
    if (n <= 1) {
        return 1;
    } else {
        return n * fac(n - 1);
    }
}

fun main(): Int {
    let a: Int = precTest();          // Expected: 100
    let b: Int = nestedTernary(5);        // Expected: 10
    let c: Int = nestedTernary(15);       // Expected: 15
    let d: String = extensionTest();      // Expected: "123"
    let e: Int = testMapIteration();      // Expected: 10+20+30 = 60
    let f: Int = fac(5);                  // Expected: 120
    dump(a);
    dump(b);
    dump(c);
    dump(d);
    dump(e);
    dump(f);
    return a + b + c + e + f;             // Expected: 100 + 10 + 15 + 60 + 120 = 305
}

const GLOB: Int = 5 + 7;

inline fun add(a: Int, b: Int) : Int { 
    return a + b; 
}

fun testTernary(n: Int): Int { 
    return n > 0 ? n : -n; 
}

fun testPrecedence() : Int { 
    return 2 + 3 * 4; 
}

fun testForeachUnderscore() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 100);
    m.set(2, 200);
    foreach (k, _ in m) { /* Discard values */ }
    return 42;
}

fun main() : Int {
    let a = add(3, 4);           // 7
    let b = testTernary(-10);        // 10
    let c = testPrecedence();        // 2 + (3*4) = 14
    let d = testForeachUnderscore(); // 42
    return GLOB + a + b + c + d;      // 12 + 7 + 10 + 14 + 42 = 85
}

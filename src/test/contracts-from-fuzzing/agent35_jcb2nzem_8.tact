// Test: return from within a foreach loop inside a function
fun returnFromForeach(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    foreach (k, v in m) { if (k == 1) { return v; } }
    return 0
}

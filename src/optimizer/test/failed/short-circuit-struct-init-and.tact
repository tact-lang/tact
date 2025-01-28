primitive Bool;
primitive Int;

struct STest {
    A: Bool = true && exception(0);
}

// Div by zero when v = 0
fun exception(v: Int): Bool {
    return 1 / v == 0;
}
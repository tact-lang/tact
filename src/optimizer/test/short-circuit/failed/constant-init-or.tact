primitive Bool;
primitive Int;

const A: Bool = false || exception(0);

// Div by zero when v = 0
fun exception(v: Int): Bool {
    return 1 / v == 0;
}
fun div_mod_identity(a: Int, b: Int): Int {
    return (a / b) * b + (a % b);
}

fun test_identity(): Int {
    // Using negative dividend to test rounding behavior
    let a = -7;
    let b = 3;
    return div_mod_identity(a, b);
}

fun main() {
    let _ = test_identity();
}

fun complexOperation(): Int {
    // Testing combined operations with explicit parentheses to ensure correct precedence
    let a: Int = 5 * (10 - 3) + -(-2); // 5 * 7 + 2 = 35 + 2 = 37
    let b: Int = 5 << 2;             // 5 shifted left by 2 => 5 * 2^2 = 20
    let c: Int = b - (a / 7);         // 20 - (37 / 7) = 20 - 5 = 15, integer division
    return a + b + c;               // 37 + 20 + 15 = 72
}

fun main(): Int {
    return complexOperation();
}

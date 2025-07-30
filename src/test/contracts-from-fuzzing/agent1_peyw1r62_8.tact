fun testLogical(): Int {
    // Evaluates the expression: !false && false || true
    // According to operator precedence, ! has highest precedence: !false = true
    // Then, && is evaluated: true && false = false
    // Then, || is evaluated: false || true = true
    // Thus, the final boolean value is true, which we convert to Int: true ? 1 : 0 => 1
    let a: Bool = !false && false || true;
    return a ? 1 : 0;
}

fun testRelational(): Int {
    // Testing relational operators
    let less: Bool = 5 < 10;      // true
    let le: Bool = 10 <= 10;      // true
    let greater: Bool = 10 > 5;   // true
    let ge: Bool = 10 >= 11;      // false
    
    // Combining conditions: all should be true: true && true && true && true
    let cond: Bool = less && le && greater && (!ge);
    
    // Convert boolean to int: true => 1, false => 0
    return cond ? 1 : 0;
}

fun main() : Int {
    let logRes: Int = testLogical();   // expected 1
    let relRes: Int = testRelational();  // expected 1
    return logRes + relRes;              // expected overall result: 2
}

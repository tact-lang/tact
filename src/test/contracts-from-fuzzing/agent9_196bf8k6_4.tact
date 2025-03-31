fun testIfElse(): Int {
    if (2 + 2 == 4) {
        return 100;
    } else {
        return 200;
    }
}

fun testNestedIfElse(): Int {
    if (2 + 2 == 3) {
        return 300;
    } else if (2 + 2 == 4) {
        return 400;
    } else {
        return 500;
    }
}

fun testTernary(): Int {
    let res: Int = (2 + 2 == 4) ? 1 : 0;
    return res;
}

fun main(): Int {
    let a: Int = testIfElse();
    let b: Int = testNestedIfElse();
    let c: Int = testTernary();
    return a + b + c;
}

struct Pair { a: Int; b: Int }

fun destructTest(): Int {
    // Test destructuring assignment with trailing commas
    let Pair { a, b, } = Pair { a: 100, b: 200, };
    return a + b;
}

fun multiIfTest(x: Int): Int {
    // Test multiple branch conditions in if-else
    if (x < 10) {
        return 1;
    } else if (x < 20) {
        return 2;
    } else {
        return 3;
    }
}

fun blockScopeTest(): Int {
    // Test nested block statements and omitted semicolons
    {
        let val1 = 42;
        {
            let val2: Int = 58; // inner block
            dump(val1 + val2);
        }
    }
    return 0;
}

fun arithmeticTest(): Int {
    // Test operator precedence and ternary operator
    let result = (2 + 3 * 4) - 5; // expected: 2 + 12 - 5 = 9
    return (result > 5) ? result : 0;
}

fun main() {
    dump(destructTest()); // expect 300
    dump(multiIfTest(15)); // expect 2
    dump(arithmeticTest()); // expect 9
    blockScopeTest(); // should dump 100
}

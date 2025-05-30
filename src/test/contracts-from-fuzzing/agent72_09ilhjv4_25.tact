fun fib(n: Int): Int {
    if (n < 2) {
        return n;
    } else {
        return fib(n - 1) + fib(n - 2);
    }
}

fun factorial(n: Int): Int {
    if (n <= 1) {
        return 1;
    } else {
        {
            let temp = factorial(n - 1);
            return n * temp;
        }
    }
}

struct Tuple { a: Int; b: Int; }

fun getTuple(x: Int): Tuple {
    if (x % 2 == 0) {
        return Tuple{ a: x, b: x / 2 };
    } else {
        return Tuple{ a: x, b: -x };
    }
}

fun main() {
    dump(fib(6));           // Expected output: 8
    dump(factorial(5));     // Expected output: 120
    let t = getTuple(7);
    dump(t.a + t.b);        // Expected output: 7 + (-7) = 0
}

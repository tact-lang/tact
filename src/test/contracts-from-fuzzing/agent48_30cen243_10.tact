struct S { a: Int; b: Int? }

fun add1(x: Int): Int { return x + 1; }

contract TestFunctionChain2 {
    receive() {
        // Expected: add1(5) = 6, so 10 + 6 = 16, then add1(16) = 17
        dump(add1(10 + add1(5)));
    }
}

contract TestFieldPrecedence {
    receive() {
        let s = S { a: 10, b: 20 };
        // Using non-null assertion on s.b
        dump(s.a + (s.b!!)); // Expected: 10 + 20 = 30
    }
}

contract TestNonNullErr {
    receive() {
        let n: Int? = null;
        try {
            dump(n!!);
        } catch (e) {
            // Expecting a Null reference exception with exit code 128
            dump(e);
        }
    }
}

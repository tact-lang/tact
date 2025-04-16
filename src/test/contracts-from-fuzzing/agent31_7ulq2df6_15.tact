contract OperatorTest {
    receive() {
        // Ternary operator right associativity tests:
        let x1 = false ? 1 : false ? 2 : 3; // interpreted as false ? 1 : (false ? 2 : 3); expected 3
        dump(x1);
        let x2 = false ? 1 : true ? 2 : 3;  // interpreted as false ? 1 : (true ? 2 : 3); expected 2
        dump(x2);

        // Division operator tests (rounding towards -∞):
        let d1 = 3 / 2;   // expected 1
        dump(d1);
        let d2 = -3 / 2;  // expected -2
        dump(d2);

        // Operator precedence test:
        let e = 5 + 4 * 2; // expected: 5 + (4*2) = 13
        dump(e);

        // Augmented assignment operators tests:
        let a = 10;
        a += 5;          // expected 15
        dump(a);
        a *= 2;          // expected 30
        dump(a);

        cashback(sender());
    }

    get fun test1(): Int {
        return false ? 1 : false ? 2 : 3; // expected: 3
    }

    get fun test2(): Int {
        return false ? 1 : true ? 2 : 3; // expected: 2
    }

    get fun div1(): Int {
        return 3 / 2;   // expected: 1
    }

    get fun div2(): Int {
        return -3 / 2;  // expected: -2
    }

    get fun sumTest(): Int {
        let x = 5 + 4 * 2; // expected: 13
        let a = 10;
        a += 5;          // 15
        a *= 2;          // 30
        return x + a;    // expected: 13 + 30 = 43
    }
}

fun main() {}

struct Point { x: Int; y: Int }

fun add(a: Int, b: Int) : Int { return a + b; }

contract OperatorExpressionsTest {
    receive() {
        // Unary operators
        dump(-42);
        dump(!false);

        // Binary operators
        dump(10 + 20);
        dump(30 - 5);
        dump(6 * 7);
        dump(20 / 4);

        // Ternary operator
        dump(true ? 100 : 200);
        dump(false ? (1 + 2) : (3 * 4));

        // Parentheses and precedence
        dump((2 + 3) * 4);
    }
}

contract FieldAccessTest {
    receive() {
        let p: Point = Point { x: 10, y: 20 };
        dump(p.x);
        dump(p.y);
        dump(p.x + p.y);
    }
}

contract FunctionCallExpressionTest {
    receive() {
        // Call the function add
        dump(add(15, 25));
        // Inline expressions as arguments
        dump(add(5 + 5, 10 * 2));
    }
}

contract OptionalExpressionsTest {
    receive() {
        let val: Int? = null;
        // Optional check and forced unwrapping
        if (val == null) {
            dump(0);
        } else {
            dump(val!!);
        }
    }
}

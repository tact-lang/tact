contract Test1 {
    receive() {
        // Literal integer expression
        dump(42);
    }
}

contract Test2 {
    receive() {
        // Literal boolean expression
        dump(true);
    }
}

contract Test3 {
    receive() {
        // Binary operator: addition
        dump(42 + 8);
    }
}

contract Test4 {
    receive() {
        // Literal string expression
        dump("Hello, Tact!");
    }
}

// --- Unary Expressions ---
contract Test5 {
    receive() {
        // Unary minus for integers
        dump(-42);
    }
}

contract Test6 {
    receive() {
        // Logical negation
        dump(!false);
    }
}

// --- Field Access and Nested Expressions ---
struct Example { field: Int }

contract Test7 {
    receive() {
        // Create struct and access field
        let ex = Example { field: 100 };
        dump(ex.field);
    }
}

// --- Function Calls and Chaining ---
fun add1(x: Int): Int { return x + 1; }

contract Test8 {
    receive() {
        // Function call chaining
        dump(add1(add1(5)));
    }
}

// --- Parenthesized Expressions and Precedence ---
contract Test9 {
    receive() {
        // Parenthesized expression to enforce precedence
        dump((1 + 2) * 3); // expected 9
    }
}

// --- Ternary Operator ---
contract Test10 {
    receive() {
        // Simple ternary operator
        dump(true ? 1 : 2);
    }
}

contract Test11 {
    receive() {
        // Nested ternary operator with alternative cases
        dump(false ? 1 : (true ? 2 : 3)); // expected 2
    }
}

// --- Binary Operator Precedence ---
contract Test12 {
    receive() {
        // Test operator precedence: multiplication has higher precedence
        dump(1 + 2 * 3); // expected 7
    }
}

// --- Casting and Type Coercion ---
contract Test13 {
    receive() {
        // Using an extension function for type coercion
        // asComment() converts a String to a Cell
        dump("Casting example".asComment());
    }
}

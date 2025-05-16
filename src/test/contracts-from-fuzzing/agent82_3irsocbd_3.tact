struct S { x: Int }

fun double(x: Int): Int { return x * 2; }

// Test literal expressions: integer literals (decimal, hexadecimal, octal, binary)
contract TestLiteralInt {
    receive() {
         dump(42);
         dump(0xF);
         dump(0o777);
         dump(0b1010);
    }
}

// Test literal expressions: boolean literals
contract TestLiteralBool {
    receive() {
         dump(true);
         dump(false);
    }
}

// Test literal expressions: string literals with escape sequences
contract TestLiteralString {
    receive() {
         dump("hello");
         dump("Tact\nFuzz");
    }
}

// Test unary expressions: unary minus
contract TestUnaryMinus {
    receive() {
         dump(-5);
         dump(-(-10));
    }
}

// Test unary expressions: logical not
contract TestUnaryNot {
    receive() {
         dump(!false);
         dump(!true);
    }
}

// Test binary expressions: addition
contract TestBinaryAddition {
    receive() {
         dump(1 + 2);
         dump(42 + 58);
    }
}

// Test binary expressions: subtraction
contract TestBinarySubtraction {
    receive() {
         dump(10 - 4);
         dump(5 - 7);
    }
}

// Test binary expressions: multiplication
contract TestBinaryMultiplication {
    receive() {
         dump(3 * 4);
         dump(7 * -2);
    }
}

// Test binary expressions: division
contract TestBinaryDivision {
    receive() {
         dump(10 / 3);
         dump(-10 / 3);
    }
}

// Test binary expressions: modulus
contract TestBinaryModulo {
    receive() {
         dump(10 % 3);
         dump(-10 % 3);
    }
}

// Test field access in struct
contract TestFieldAccess {
    receive() {
         let s: S = S { x: 100 };
         dump(s.x);
    }
}

// Test optional expression and non-null assertion
contract TestOptional {
    receive() {
         let x: Int? = 123;
         dump(x!!);
    }
}

// Test function call
contract TestFunctionCall {
    receive() {
         dump(double(21));
    }
}

// Test method call on literal (extension function call)
contract TestMethodCall {
    receive() {
         dump(42.toString());
    }
}

// Test ternary expression
contract TestTernary {
    receive() {
         dump(true ? 1 : 0);
         dump(1 + 1 == 2 ? "yes" : "no");
    }
}

// Test parenthesized expressions and precedence
contract TestParentheses {
    receive() {
         dump((2 + 3) * (4 - 1));
         dump(2 + 3 * 4);
    }
}

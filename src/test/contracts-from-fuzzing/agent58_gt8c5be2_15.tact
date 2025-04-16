contract TestAddressExtensions {
    receive() {
         // Testing Address extension functions
         let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
         let s: String = a.toString();
         let slice1: Slice = a.asSlice();
         let slice2: Slice = beginCell().storeAddress(a).asSlice();
         // No further comparison; this tests that extension functions compile and return expected types
    }
}

contract TestLogicalAnd {
    receive() {
         // Short-circuit: false && (1/0 > 0) should not evaluate the second operand
         let cond: Bool = false && (1 / 0 > 0);
    }
}

fun foo(x: Int): Int {
    return x + 1;
}

contract TestFunctionCalls {
    receive() {
         // Testing function call chaining
         let a: Int = foo(foo(5));
    }
}

contract TestFromBase64 {
    receive() {
         // Testing Base64 decoding from a String
         let base64Str: String = "SGVyZSdzIEpvaG5ueSE=";
         let slice: Slice = base64Str.fromBase64();
    }
}

contract TestModulus {
    receive() {
         // Testing modulus operator
         let m: Int = 17 % 5; // Expected result: 2
    }
}

contract TestAugmentedAssignment {
    receive() {
         // Testing augmented assignment operator
         let x: Int = 10;
         x += 5;
    }
}

contract TestBitwiseOperators {
    receive() {
         // Testing bitwise operators
         let a: Int = 42;
         let b: Int = 15;
         let bitOr: Int = a | b;
         let bitAnd: Int = a & b;
         let bitXor: Int = a ^ b;
         let shiftLeft: Int = a << 2;
         let shiftRight: Int = a >> 1;
    }
}

contract TestTernaryDeep {
    receive() {
         // Testing ternary operator
         let value: Int = (2 < 3) ? 100 : 200;
    }
}

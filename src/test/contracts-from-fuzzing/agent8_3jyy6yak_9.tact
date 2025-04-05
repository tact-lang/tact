struct Dummy { val: Int; }

fun inc(x: Int) : Int { return x + 1; }

contract ComplexExpressionsTest {
    receive() {
        // Literal expressions: various numeral representations
        dump(42);                   // decimal
        dump(0x2A);                 // hexadecimal (42)
        dump(0o52);                 // octal (42)
        dump(0b101010);             // binary (42)
        
        // Unary and binary operators
        dump(-42);                  // unary negation
        dump(!true);                // logical not
        dump(2 + 3 * 4);            // 2 + (3*4) = 14
        dump((2 + 3) * 4);          // (2+3)*4 = 20
        
        // Ternary operator with nested alternatives
        dump(false ? 1 : (true ? 2 : 3));  // evaluates to 2
        dump(true ? (false ? 4 : 5) : 6);    // evaluates to 5
        
        // Optional expression and forced unwrapping
        let opt: Int? = 10;
        if (opt != null) {
            dump(opt!! + 1);      // 10 + 1 = 11
        } else {
            dump(0);
        }
        
        // Function call expressions with inline arithmetic
        dump(inc(5 + 6));           // 5+6 = 11, then inc(11) = 12
        
        // Field access in a struct
        let d: Dummy = Dummy { val: 99 };
        dump(d.val);
        
        // Chaining conversion: Int -> String -> Slice -> String
        let s: String = (99).toString();
        dump(s.asSlice().asString());   // should output "99"
    }
}

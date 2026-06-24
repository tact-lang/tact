/* Comprehensive Fuzz Testing of Return Statements Edge Cases in Tact (Final Adjusted Version) */

// Message definition for receiver tests
message TestMsg { x: Int; }

// Function: Nested if-else with multiple return paths
fun ret_nested_if(x: Int): Int {
    if (x > 10) {
        if (x < 20) {
            return x * 2;
        } else {
            return x;
        }
    } else if (x == 10) {
        return 10;
    } else {
        return 0;
    }
}

// Function: Using ternary operator within return
fun ret_ternary(x: Int): Int {
    return x > 100 ? x - 100 : 100 - x;
}

// Function: Implicit return with final expression (adjusted with explicit returns)
fun ret_implicit(x: Int): Int {
    if (x == 0) { return 0; } else { return x; }
}

// Function: Nested ternary operator used in return statement
fun ret_nested_ternary(x: Int): Int {
    return x > 0 ? (x > 10 ? x - 10 : x + 10) : 0;
}

// Function: Recursive function using return
fun rec_return(x: Int): Int {
    if (x <= 0) {
        return 0;
    }
    return x + rec_return(x - 1);
}

// Contract with a getter that uses a ternary expression in its return
contract ComplexReturnGetter {
    v: Int = 0;  // Providing an initial value for state variable
    
    get fun complex(): Int {
        return self.v >= 0 ? self.v : -self.v;
    }
    
    receive() {}
}

// Contract with a receiver that does not return a value
contract ComplexReturnReceiver {
    receive(msg: TestMsg) {
        if (msg.x < 5) {
            return;
        }
        dump(msg.x);
    }
}

fun main() {
    let a = ret_nested_if(15);      // expected 30
    let b = ret_ternary(150);         // expected 50
    let c = ret_ternary(50);          // expected 50
    let d = ret_implicit(0);          // expected 0
    let e = ret_implicit(42);         // expected 42
    let f = ret_nested_ternary(5);    // expected 15 (5+10)
    let g = ret_nested_ternary(15);   // expected 5 (15-10)
    let h = rec_return(5);            // expected 15 (5+4+3+2+1)

    dump(a);
    dump(b);
    dump(c);
    dump(d);
    dump(e);
    dump(f);
    dump(g);
    dump(h);

    // Note: Receiver functions are triggered externally; direct calls are not supported
}

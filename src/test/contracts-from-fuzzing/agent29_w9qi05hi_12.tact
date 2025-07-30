/* Extended fuzz-test suite for return statements in Tact
   covering functions, nested blocks, conditional returns, repeats, recursion,
   optional returns, destructuring assignment in returns, and return behavior in getters and receiver functions.

   Note: Tests that trigger unreachable code errors have been modified to avoid compilation failure.
*/

// Test Case 1: Regular function with conditional return
fun test1(x: Int): Int {
    if (x > 10) {
        return x;
    } else {
        return 10;
    }
}

// Test Case 2: Function with a repeat loop and nested block returns
fun test2(n: Int): Int {
    repeat(n) {
        if (n == 0) {
            return 0;
        }
        if (n == 2) {
            { return 2; }
        }
    }
    return n;
}

// Test Case 3: Function with nested blocks inside an if
fun test3(b: Bool): Int {
    if (b) {
        {
            if (b) {
                return 1;
            } else {
                return 2;
            }
        }
    }
    return 3;
}

// Test Case 4: Function with a block that conditionally returns (modified to avoid unreachable code)
fun test4(): Int {
    if (false) { return 100; }
    return 0;
}

// Test Case 5: Function returning an optional Int
fun test5(x: Int): Int? {
    if (x > 5) {
        return x;
    }
    return null;
}

// Test Case 6: Recursive function (factorial)
fun factorial(n: Int): Int {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

// Test Case 7: Function using destructuring assignment and a ternary conditional
struct TupleInt {
    first: Int;
    second: Int;
}

fun destructReturn(): Int {
    let TupleInt { first, second } = TupleInt { first: 5, second: 10 };
    return first < second ? first : second;
}

// Message for receiver testing
message Msg { 
    val: Int 
}

// Contract to test return behavior in getters and receiver functions
contract ReturnContract {
    y: Int;

    init() {
        self.y = 50;
    }

    // Getter with explicit return
    get fun getY(): Int {
        return self.y;
    }

    // Getter that computes double the value of y
    get fun getDoubleY(): Int {
        let a = self.y;
        return a + a;
    }

    // Receiver function using a message type to demonstrate early return
    receive(msg: Msg) {
        if (msg.val < 0) {
            return;
        }
        // Convert the integer to a cell for the message body
        let bodyCell = beginCell().storeInt(msg.val, 32).endCell();
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: bodyCell
        });
    }
}

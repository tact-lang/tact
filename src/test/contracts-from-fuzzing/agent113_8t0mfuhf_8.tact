struct TupleResult {
    first: Int;
    second: Int;
}

contract ReturnBehaviorTest {

    // Regular function: early return using nested block
    fun earlyReturn(x: Int): Int {
        if (x > 10) {
            return x;
        } else {
            { return x + 1; }
        }
    }

    // Function: loop with conditional early return
    fun loopReturn(): Int {
        let counter: Int = 0;
        repeat (3) {
            // Manually update counter
            counter = counter + 1;
            if (counter == 2) {
                return 100;
            }
        }
        return 0;
    }

    // Function: optional return, returning null when x is 0
    fun optionalReturn(x: Int): Int? {
        if (x == 0) {
            return null;
        } else {
            return x * 2;
        }
    }

    // Function: nested block with return statement
    fun nestedBlockReturn(): Int {
        {
            let a: Int = 5;
            if (a == 5) { return a; }
        }
        return 0;
    }

    // Getter returning a tuple-like structured value
    get fun tupleGetter(): TupleResult {
        if (true) {
            return TupleResult { first: 1, second: 2 };
        } else {
            { return TupleResult { first: 3, second: 4 }; }
        }
    }

    // Getter returning an optional tuple-like structured value
    get fun optionalTupleGetter(): TupleResult? {
        if (false) {
            return TupleResult { first: 10, second: 20 };
        } else {
            return null;
        }
    }

    // Receiver without parameters; return statement is allowed to simply end execution
    receive() {
        return;
    }

    // Receiver with a Slice parameter; processes the incoming message
    receive(msg: Slice) {
        let s: Slice = msg;  // dummy processing
    }
}

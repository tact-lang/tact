struct GetterResult { a: Int; b: String }
struct MultiReturn { first: Int; second: Int }

contract Test {
    // Function demonstrating an early return inside a repeat loop
    fun loopReturn(x: Int): Int {
        let i: Int = 0;
        repeat (x) {
            if (i == 2) {
                return i;
            }
            i = i + 1;
        }
        return i;
    }

    // Getter returning a struct as a complex return value
    get fun fixedGetter(): GetterResult {
        if (true) {
            return GetterResult { a: 300, b: "fixed" };
        }
        return GetterResult { a: 400, b: "never" };
    }

    // Receiver with explicit return
    receive () {
        return;
    }

    // Function with nested block returning early
    fun nestedReturn(x: Int): Int {
        {
            if (x == 0) {
                return 0;
            }
        }
        return x + 10;
    }

    // Regular function with multiple return paths using a struct for multiple values
    fun multiReturn(x: Int): MultiReturn {
        if (x < 10) {
            return MultiReturn { first: x, second: x + 1 };
        } else {
            return MultiReturn { first: x + 2, second: x + 3 };
        }
    }
}

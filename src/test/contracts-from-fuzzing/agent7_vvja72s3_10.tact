struct TupleType { a: Int; b: String }

contract ReturnValidTests {
    v: Int;

    init() {
        self.v = 0;
    }

    receive() {}

    // Test 1: Early return in regular function
    fun add(a: Int, b: Int): Int {
        if (a == 0) { return b; }
        return a + b;
    }

    // Test 2: Nested block with return
    fun nestedReturn(a: Int): Int {
        {
            if (a > 0) { return a; }
        }
        return -a;
    }

    // Test 3: While loop with early return
    fun whileReturn(n: Int): Int {
        let i: Int = 0;
        while (i < n) {
            if (i == 5) { return i; }
            i = i + 1;
        }
        return 0;
    }

    // Test 4: Getter function with return
    get fun getterTest(): Int {
        if (self.v > 0) { return self.v; }
        return 0;
    }

    // Test 5: Function returning an optional value
    fun optionalReturn(x: Int): Int? {
        if (x > 0) { return x; }
        return null;
    }

    // Test 6: Function returning a tuple via a struct
    fun tupleReturn(flag: Bool): TupleType {
        if (flag) { return TupleType { a: 42, b: "hello" }; }
        return TupleType { a: 0, b: "world" };
    }

    // Test 7: Receiver function with early return
    receive("fastReturn") {
        if (1 == 1) { return; }
        dump(2);
    }

    // Test 8: Void function defined without explicit return type
    fun voidFunction() {
        // no return needed
    }
}

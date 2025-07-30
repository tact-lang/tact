contract OptionalMapTest {
    // Persistent map of Int to Int declared via contract fields
    m: map<Int, Int>;

    init() {
        // Initialize the map to empty (which is null by default, so we use emptyMap())
        self.m = emptyMap();
        
        // Check that a non-existent key returns null
        if (self.m.get(5) != null) {
            dump(1); // should not happen
        } else {
            dump(0); // expected output: 0
        }
        
        // Set key 5 to 77
        self.m.set(5, 77);
        let v = self.m.get(5)!!; // using non-null assertion; expected 77
        dump(v); // expected output: 77
    }

    receive() {
        cashback(sender());
    }

    get fun getValue(): Int {
        return self.m.get(5)!!;
    }
}

contract TryCatchTest {
    receive() {
        // A try-catch block: the require should fail
        try {
            require(1 == 2, "fail!");
        } catch (exitCode) {
            dump(exitCode); // expected to dump the exit code for require failure
        }
        cashback(sender());
    }

    get fun getCatchValue(): Int {
        // In a getter, use try-catch to return a fallback value
        try {
            require(0 == 1, "error");
            return 100; // not reached
        } catch (code) {
            return code; // returns the exit code of the require failure
        }
    }
}

fun main() {}

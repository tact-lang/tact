contract ConstAndExpTest {
    // Persistent state variable declared using contract field syntax
    counter: Int = 10;

    // Contract constants computed at compile time
    const A: Int = 100;
    const B: Int = 50;

    init() {
        // Modify persistent state in init
        self.counter = self.counter + 5; // counter becomes 15
    }

    // Getter function returning sum of persistent state and constants
    get fun sum(): Int {
        // According to docs, getters can only read values (state + constants)
        return self.counter + self.A + self.B; // expected: 15 + 100 + 50 = 165
    }

    // Dummy receiver to allow deployment
    receive() { }
}

fun testExp(): Int {
    // Test exponentiation function pow as documented
    return pow(2, 10); // expected 1024
}

fun main() {
    dump(testExp());
}

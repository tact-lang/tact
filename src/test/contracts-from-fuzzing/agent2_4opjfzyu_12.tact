contract GetterModify {
    x: Int;

    init() {
        self.x = 10;
    }

    // Getter function that, at runtime, modifies state variable 'x'.
    // According to documentation, getters are not allowed to modify state variables
    // permanently; any modifications should not be persisted beyond the TVM run.
    // Here, we test whether such modifications are accepted by the compiler.
    get fun get_and_modify(): Int {
        self.x = self.x + 5;
        return self.x;
    }
}

fun main() {}

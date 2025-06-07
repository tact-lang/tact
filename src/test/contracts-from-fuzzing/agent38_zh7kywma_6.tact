trait A {
    // Declaration of a persistent state variable (not initialized in trait)
    x: Int;
}

trait B {
    // Declaration of a persistent state variable with the same name
    x: Int;
}

contract C(x: Int) with A, B {
    // No init function required because persistent state variable is provided as contract parameter
    // But conflict could happen: which x gets used?

    get fun getX(): Int {
        return self.x;
    }
}

fun main() {
    return;
}

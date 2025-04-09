trait A {
    virtual fun greet(): String {
        return "Hello from A";
    }
}

trait B {
    virtual fun greet(): String {
        return "Hello from B";
    }
}

contract C() with A, B {
    // Required override since two traits provide greet() method.
    override fun greet(): String {
        // For this test, choose A's message
        return "Hello from A";
    }

    get fun callGreet(): String {
        return self.greet();
    }
}

fun main() {
    return;
}

trait T1 {
    virtual fun foo(): Int { return 1; }
}

trait T2 {
    virtual fun foo(): Int { return 2; }
}

contract C() with T1, T2 {
    // Conflict resolution: override foo() explicitly to resolve ambiguity
    override fun foo(): Int {
        return 42;
    }

    receive() {
        let x = self.foo();
        dump(x);
    }
}

fun main() {
    let _ = initOf C();
}

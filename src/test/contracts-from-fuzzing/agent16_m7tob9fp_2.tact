trait A {
    abstract const AVal: Int;
}

trait B with A {
    override const AVal: Int = 10;
}

trait C with A {
    override const AVal: Int = 20;
}

contract Conflicted() with B, C {
    // No override provided, so AVal is ambiguous between B and C
    receive() {
         // For testing, we do nothing special
         cashback(sender());
    }
}

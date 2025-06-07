trait A {
    abstract const AVal: Int;
}

trait B with A {
    override const AVal: Int = 10;
}

trait C with A {
    override const AVal: Int = 20;
}

contract Conflicted2() with B, C {
    // No explicit override provided; this should be ambiguous according to documentation
    receive() {
        dump(self.AVal); // Which value will be shown?
        cashback(sender());
    }
}

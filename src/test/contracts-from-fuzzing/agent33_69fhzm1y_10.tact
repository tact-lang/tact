trait Wild {
    // Correct abstract function with discarded parameter
    abstract fun foo(_: Int);
}

contract Imp with Wild {
    // Override using a proper identifier name
    override fun foo(a: Int) {
        // Implementation: simply do nothing
        return;
    }

    receive() {}
}

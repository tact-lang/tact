contract TestContract(val: Int) {
    // When using contract parameters, the persistent field is accessed with 'self.val'
    receive() { dump(self.val); }
}

fun test_contract_parameters() {
    // In practice, deploying the contract will provide a value. Here we simulate an instance by just testing compilation.
    dump(0);
}

fun test_empty_cell() {
    dump(emptyCell());
}

fun test_dumpStack_usage() {
    dumpStack();
}

fun main() {
    test_contract_parameters();
    test_empty_cell();
    test_dumpStack_usage();
}

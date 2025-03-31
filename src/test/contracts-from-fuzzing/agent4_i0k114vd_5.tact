struct TestTupleOutput {
    value1: Int;
    flag: Bool;
}

contract TestTuple {
    receive() {}
    
    // Getter returning a tuple represented as a struct wrapped in an optional
    get fun getTuple(): TestTupleOutput? {
         return TestTupleOutput { value1: 1, flag: true };
    }
}

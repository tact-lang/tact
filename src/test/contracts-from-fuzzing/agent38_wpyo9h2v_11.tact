struct TupleType {
    first: Int;
    second: Bool;
}

contract Test_TupleGetter {
    receive() {}
    
    // Getter function returning a tuple represented as a struct, as per documentation
    get fun getTuple(): TupleType? {
        return TupleType { first: 42, second: true };
    }
}

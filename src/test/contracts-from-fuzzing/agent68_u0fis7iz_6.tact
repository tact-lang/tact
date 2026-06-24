struct TupleReturn {
    first: Int;
    second: Bool;
}

contract GetterStructOptional {
    receive() {}
    
    get fun getTupleOptional(): TupleReturn? {
        return TupleReturn { first: 42, second: true };
    }
}

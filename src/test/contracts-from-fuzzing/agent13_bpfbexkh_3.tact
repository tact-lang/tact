struct TupleRes {
    first: Int;
    second: Bool;
}

contract Test {
    get fun getTuple(): TupleRes {
        return TupleRes{ first: 42, second: true };
    }
    
    receive() {}
}

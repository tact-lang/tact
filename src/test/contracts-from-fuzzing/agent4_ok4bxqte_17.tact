struct T { a: Int; b: Int; }

contract TestTupleReturn {
    fun retTuple(): T {
        return T { a: 10, b: 20 };
    }
    
    receive () {}
}

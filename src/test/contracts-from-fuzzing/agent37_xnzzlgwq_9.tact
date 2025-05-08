struct Pair {
    a: Int;
    b: Int;
}

contract TestTupleReturn {
    fun tupleReturn(): Pair {
        return Pair{
            a: 1,
            b: 2
        };
    }
}

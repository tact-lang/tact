struct Pair {
    a: Int;
    b: Int;
}

contract TestOptional {
    receive() {}
    
    // Getter returning an optional Pair, currently returning null
    get fun getOptionalPair(): Pair? {
        return null;
    }
}

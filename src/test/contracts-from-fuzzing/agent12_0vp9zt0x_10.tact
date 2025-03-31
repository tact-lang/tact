struct SimpleState {
    a: Int;
    b: Int;
}

contract TupleGetter {
    receive() {}

    // Getter returning a tuple mapped to a struct as an optional type
    get fun getTuple() : SimpleState? {
        return SimpleState{ a: 10, b: 20 };
    }
}

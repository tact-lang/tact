struct MyTuple {
    a: Int;
    b: Int;
}

contract TestTupleGetter {
    receive() {}

    // Getter returning a tuple converted to a struct (as an optional)
    get fun getTuple(): MyTuple? {
        return MyTuple { a: 1, b: 2 };
    }
}

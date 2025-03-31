struct Tuple2 {
    a: Int;
    b: Int;
}

contract TestTupleGetterConverted {
    v: Int = 10;

    receive() {}

    // Getter function returning a composite type (struct instead of tuple)
    get fun getTuple(): Tuple2 {
        return Tuple2 { a: self.v, b: self.v + 1 };
    }
}

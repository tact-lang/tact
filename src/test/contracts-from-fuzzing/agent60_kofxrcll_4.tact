struct TupleValue {
    value1: Int;
    value2: Bool;
}

contract TestTuple {
    value1: Int = 100;
    value2: Bool = true;

    receive() {}

    get fun getTuple(): TupleValue {
        return TupleValue{
            value1: self.value1,
            value2: self.value2
        };
    }
}

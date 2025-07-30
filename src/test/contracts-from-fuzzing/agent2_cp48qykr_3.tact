struct TupleData {
    value: Int;
    flag: Bool;
}

contract TestComposite {
    receive() {}

    get fun getTuple(): TupleData? {
        return TupleData{
            value: 42,
            flag: true
        };
    }
}
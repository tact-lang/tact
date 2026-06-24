struct TupleData {
    a: Int;
    b: Bool;
}

contract GetterComposite {
    value: TupleData = TupleData{
        a: 1,
        b: true
    };

    receive() {}

    get fun getTupleData(): TupleData {
        return self.value;
    }
}

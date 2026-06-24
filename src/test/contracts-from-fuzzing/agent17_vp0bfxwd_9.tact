struct TupleField {
    first: Int;
    second: Int;
}

struct Container {
    data: TupleField;
}

contract TestTupleField {
    receive() {
        let s: Container = Container { data: TupleField { first: 10, second: 20 } };
        let sum: Int = s.data.first + s.data.second;
    }
}

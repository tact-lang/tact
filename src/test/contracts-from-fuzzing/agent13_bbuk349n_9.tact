struct NestedComplex {
    op: Int? as int256;
    data: map<Int, Int as int256>;
}

contract Test {
    receive() {
        let nc = NestedComplex{
            op: null,
            data: emptyMap()
        };
        let _ = nc.op;
        let _ = nc.data;
    }
}

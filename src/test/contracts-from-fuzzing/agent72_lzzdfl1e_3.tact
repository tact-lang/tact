struct TupleReturn {
    a: Int;
    b: Bool;
}

contract Test {
    v: Int = 10;
    flag: Bool = false;
    
    receive() {}

    get fun getComposite(): TupleReturn? {
        return TupleReturn { a: self.v, b: self.flag };
    }
}

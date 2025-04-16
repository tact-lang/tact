struct TupleResult {
    x: Int;
    y: Bool;
}

contract Test4 {
    x: Int = 10;
    y: Bool = true;
    
    get fun getTuple(): TupleResult {
         return TupleResult { x: self.x, y: self.y };
    }
    
    receive() {}
}

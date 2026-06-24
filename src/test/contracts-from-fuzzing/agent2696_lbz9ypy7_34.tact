struct Inner {
    x: Int;
    y: Int?;
}

contract FieldAccess {
    data: Inner;
    init() {
        self.data = Inner{ x:5, y:null };
    }
}
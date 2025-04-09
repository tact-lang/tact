struct SInner {
    i: Int;
    b: Bool;
    s: String;
    innerRef: Cell;
}

contract Base {
    data1: SInner;
    data2: SInner;

    init() {
        self.data1 = SInner{i:1, b:true, s:"a", innerRef: emptyCell() };
        self.data2 = SInner{i:2, b:false, s:"b", innerRef: emptyCell() };
    }
}

struct Inner {
    i: Int;
    b: Bool;
}

contract Test15 {
    innerList0: Inner;
    innerList1: Inner;
    innerList2: Inner;
    innerList3: Inner;
    innerList4: Inner;
    innerList5: Inner;
    innerList6: Inner;
    innerList7: Inner;
    innerList8: Inner;
    innerList9: Inner;

    init() {
        self.innerList0 = Inner{ i:0, b:false };
        self.innerList1 = Inner{ i:1, b:true };
        self.innerList2 = Inner{ i:2, b:false };
        self.innerList3 = Inner{ i:3, b:true };
        self.innerList4 = Inner{ i:4, b:false };
        self.innerList5 = Inner{ i:5, b:true };
        self.innerList6 = Inner{ i:6, b:false };
        self.innerList7 = Inner{ i:7, b:true };
        self.innerList8 = Inner{ i:8, b:false };
        self.innerList9 = Inner{ i:9, b:true };
    }
}
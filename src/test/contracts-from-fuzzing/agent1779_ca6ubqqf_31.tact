struct OutOrder {
    a: Int;
    b: Bool;
    c: Int?;
}

contract InitPartialOrder {
    data: OutOrder;
    init() {
        self.data = OutOrder{a:0, c:null, b:true};
    }
}
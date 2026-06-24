struct MultiOption {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract LotsOfNulls {
    val: MultiOption;

    init() {
        self.val = MultiOption{ a:null, b:null, c:null, d:null, e:null };
    }
}
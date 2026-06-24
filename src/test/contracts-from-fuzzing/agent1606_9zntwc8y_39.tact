struct WeirdOrdering {
    s2: String;
    b1: Bool;
    s1: String;
    b2: Bool;
    n1: Int;
    n2: Int;
}
contract StructOrder {
    val: WeirdOrdering;
    init() {
        self.val = WeirdOrdering{
            s2:"x", b1:true, s1:"y", b2:false, n1:1, n2:2
        };
    }
    receive() {
        let v = self.val;
    }
}
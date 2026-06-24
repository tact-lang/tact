struct AltOrder {
    a: Int;
    b: Bool;
    c: String;
}

contract DiffOrdering {
    v1: AltOrder;
    v2: AltOrder;

    init() {
        self.v1 = AltOrder{ c:"hi", b:true, a:5 };
        self.v2 = AltOrder{ a:1, b:false, c:"yo" };
    }
}
struct NestedBig {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedBigContract {
    f1: NestedBig;
    f2: NestedBig;

    init() {
        self.f1 = NestedBig{ a:1, b:true, c:"x" };
        self.f2 = NestedBig{ a:2, b:false, c:"y" };
    }
}
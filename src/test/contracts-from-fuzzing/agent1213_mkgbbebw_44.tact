struct BoolNest {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract BoolNestTest {
    nest: BoolNest;

    init() {
        self.nest = BoolNest{ a:true, b:false, c:true, d:false };
    }
}
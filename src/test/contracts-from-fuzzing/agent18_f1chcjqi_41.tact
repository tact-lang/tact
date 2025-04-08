struct FlatOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

contract FlatOptTest {
    val: FlatOpt;
    init() {
        self.val = FlatOpt{ a:null, b:null, c:null, d:null };
    }
}
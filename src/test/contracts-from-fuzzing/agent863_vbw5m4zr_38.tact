struct FlatOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract FlatOptTest {
    f: FlatOpt;

    init() {
        self.f = FlatOpt{ a:null, b:null, c:null };
    }
}
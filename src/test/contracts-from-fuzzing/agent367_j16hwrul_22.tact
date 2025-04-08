// optional struct fields with nested optional inner defaults
struct InnerDefOpt {
    x: Int?;
    y: Bool?;
}

struct OuterDefOpt {
    inner: InnerDefOpt?;
    note: String = "note";
}

contract DefOptTest {
    p: OuterDefOpt;
    init() {
        self.p = OuterDefOpt { inner:null };
    }
}
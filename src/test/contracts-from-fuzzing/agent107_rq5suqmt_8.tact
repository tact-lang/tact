struct InnerOpt {
    deep: Int?;
    deep2: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    txt: String?;
}

contract DeepOptTest {
    var: OuterOpt;
    init() {
        self.var = OuterOpt{ inner: null, txt: null };
    }
}
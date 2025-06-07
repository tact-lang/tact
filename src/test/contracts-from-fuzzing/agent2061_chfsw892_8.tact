struct DeeplyOpted {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct OuterOpt {
    nested: DeeplyOpted?;
}

contract OptOptTest {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{ nested: null };
    }
}
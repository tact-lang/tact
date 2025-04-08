// Nested struct with many optionals inside optional struct
struct NestedOpt {
    xs: Int?;
    bs: Bool?;
    txt: String?;
}

struct OuterOpt {
    nested: NestedOpt?;
    v: Int;
}

contract OptOptTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: NestedOpt{
                xs: null,
                bs: null,
                txt: null
            },
            v: 77
        };
    }
}

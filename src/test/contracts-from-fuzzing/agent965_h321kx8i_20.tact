// optional struct with optional fields
struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract OptTest {
    val: OuterOpt;

    init() {
        self.val = OuterOpt {
            nested: null,
        };
    }
}
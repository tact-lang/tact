// test omit nested optional init
struct OptionalNest {
    sub: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract OmitOptInit {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{ sub: null };
    }
}
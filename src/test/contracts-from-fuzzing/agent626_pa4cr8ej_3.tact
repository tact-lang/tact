struct OptionalsNest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: InnerOpt?;
}

struct InnerOpt {
    x: String?;
    y: Int?;
}

contract OptsContract {
    val: OptionalsNest;

    init() {
        self.val = OptionalsNest{
            a: null,
            b: true,
            c: null,
            d: InnerOpt{ x: "hello", y: null }
        };
    }
}
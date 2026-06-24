struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapOption {
    nested: OptionalNest?;
    flag: Bool;
}

contract OptionalNestedContract {
    val: WrapOption;
    init() {
        self.val = WrapOption{
            nested: OptionalNest{
                a: 1,
                b: true,
                c: null
            },
            flag: false
        };
    }
}

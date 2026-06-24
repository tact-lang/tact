struct Outer {
    num: Int;
    opt_str: String?;
}

struct Middle {
    outer: Outer;
    opt_bool: Bool?;
}

struct Inner {
    middle: Middle?;
    addr: Address;
}

contract OptionalNestTest {
    field: Inner;

    init() {
        self.field = Inner{
            middle: null,
            addr: myAddress()
        };
    }
}
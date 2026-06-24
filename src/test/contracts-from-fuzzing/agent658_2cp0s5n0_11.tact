struct OptionalNest {
    first: Int?;
    second: String?;
    nested: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract Nullables {
    x: OptionalNest;

    init() {
        self.x = OptionalNest{
            first: null,
            second: null,
            nested: null
        };
    }
}
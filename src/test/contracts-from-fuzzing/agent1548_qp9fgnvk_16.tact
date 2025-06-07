// optional nested struct provided
struct OptionalNest {
    foo: Inner?;
    flag: Bool;
}

struct Inner {
    bar: String;
    val: Int;
}

contract Test {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            foo: Inner{ bar:"abc", val:42 },
            flag: true
        };
    }
}
// optional nested struct
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
            foo: null,
            flag: false
        };
    }
}
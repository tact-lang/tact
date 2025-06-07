struct Inner {
    inner_bool: Bool;
    inner_int: Int;
}

struct Outer {
    outer_str: String;
    opt_inner: Inner?;
}

contract NestedOptionalContract {
    data: Outer;

    init() {
        self.data = Outer{
            outer_str: "test",
            opt_inner: Inner{inner_bool: true, inner_int: 5}
        };
    }
}
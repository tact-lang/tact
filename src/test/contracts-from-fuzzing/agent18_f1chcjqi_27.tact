struct S1 {
    foo: Int;
}

struct S2 {
    foo: Int;
    bar: S1;
}

contract NestedReuse {
    val: S2;
    init() {
        self.val = S2{ foo:5, bar:S1{foo:8}};
    }
}
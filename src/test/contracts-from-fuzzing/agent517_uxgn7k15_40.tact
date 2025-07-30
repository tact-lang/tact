struct NestedCompose {
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    foo: Int;
    bar: Bool;
    baz: String;
}

struct Nested2 {
    t: Slice;
    addr: Address;
    s: String;
}

contract NestedComposeContract {
    x: NestedCompose;

    init() {
        self.x = NestedCompose{
            nested1: Nested1{ foo:1, bar:true, baz:"hello" },
            nested2: Nested2{ t:emptyCell().asSlice(), addr:myAddress(), s:"world" }
        };
    }
}
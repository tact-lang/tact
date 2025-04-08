// test contract param syntax with nested
contract ParamNested(
    count: Int,
    nested: Nested
) {
    receive() {
        // empty
    }
}

struct Nested {
    flag: Bool;
    name: String;
}
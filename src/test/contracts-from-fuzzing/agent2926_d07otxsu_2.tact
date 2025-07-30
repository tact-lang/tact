struct Nested {
    x: Int;
    y: Bool;
}

contract OptNestedStore {
    data: Int;
    nested: Nested?;

    init() {
        self.data = 42;
        self.nested = null;
    }
}
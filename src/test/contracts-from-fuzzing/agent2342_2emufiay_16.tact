trait Tr {
    foo: Int;
}

struct Inside {
    bar: Int;
}

contract NestedWithTrait with Tr {
    foo: Int;
    nested: Inside;

    init() {
        self.foo = 55;
        self.nested = Inside{ bar: 33 };
    }
}
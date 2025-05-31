struct Foo {
    x: Int;
    y: Int;
}

contract MapLiteralStructs {
    get fun structs(): map<Int as uint16, Foo> {
        return map<Int as uint16, Foo> {
            1: Foo { x: 1, y: 2 },
            2: Foo { x: 0, y: 1 },
        };
    }
}

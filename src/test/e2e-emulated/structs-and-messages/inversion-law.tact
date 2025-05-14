message Foo {
    slice: Slice?;
}

contract Test {
    slice: Slice?;

    receive() {}

    get fun fromCell(cell: Cell): Bool {
        return Foo.fromCell(cell).toCell() == cell;
    }

    get fun toCell(foo: Foo): Bool {
        return Foo.fromCell(foo.toCell()).slice == foo.slice;
    }
}

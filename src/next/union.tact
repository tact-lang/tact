union Either<L, R> {
    Left {
        $: uint1 = 0;
        left: L;
    }
    Right {
        $: uint1 = 1;
        right: R;
    }
}

union Messages {
    Foo {
        $: uint32 = 0x12345678;
        foo: uint4;
    }
    Bar {
        $: uint32 = 0x87654321;
        bar: uint8;
    }
}


UnionDecl =
    "union"
    name:TypeId
    typeParams:typeParams?
    "{"
    cases:Case*
    "}";

Case =
    name:TypeId
    "{"
    fields:structFields
    "}"
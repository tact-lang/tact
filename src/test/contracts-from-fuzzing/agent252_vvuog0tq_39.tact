struct Leaf {
    val: Int;
}

struct Mid {
    leaf: Leaf;
}

struct Top {
    mid: Mid;
    optMid: Mid?;
}

contract Foo {
    t: Top = Top {
        mid: Mid { leaf: Leaf { val:1 } }
        // optMid defaults null, omit
    };
}
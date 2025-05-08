struct Alpha {
    x: Int;
}

struct Beta {
    y: Alpha;
}

contract NestedInline {
    data: Beta = Beta{ y: Alpha{ x: 256 } };
}
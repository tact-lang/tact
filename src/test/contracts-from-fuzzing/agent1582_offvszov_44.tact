struct X {
    nested: Y?;
}

struct Y {
    s: String?;
}

contract WrapNestedNull {
    x: X = X {
        nested: null
    };
    receive() {}
}
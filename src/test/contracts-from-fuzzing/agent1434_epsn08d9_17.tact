struct Combined {
    a: Int?;
    b: Bool?;
    c: Nested;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract Test {
    data: Combined = Combined{
        a: null,
        b: true,
        c: Nested{ x: 9, y: false }
    };

    receive() {}
}
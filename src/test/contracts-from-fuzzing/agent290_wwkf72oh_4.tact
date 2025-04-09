struct Complex {
    intVal: Int;
    boolVal: Bool;
    optVal: Int?;
    nested: Nested;
}

struct Nested {
    a: Int;
    b: Bool;
    c: Int?;
}

contract TestContract {
    s: Complex = Complex{
        intVal: 5,
        boolVal: true,
        optVal: null,
        nested: Nested{a: 1, b: false, c: null}
    };
}

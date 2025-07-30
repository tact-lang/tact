struct ManyNestedOptional {
    a: Int?;
    b: Nested?;
}

struct Nested {
    x: Int?;
    y: Int?;
}

contract DefaultNestedOptional {
    data: ManyNestedOptional = ManyNestedOptional{
        a: null,
        b: Nested{
            x: null,
            y: null
        }
    };
}
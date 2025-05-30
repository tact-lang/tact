// Optional struct fields with explicit serialization sizes in nested struct
struct S {
    foo: Int? as int64;
    bar: Bool?;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            foo: null,
            bar: null,
        };
    }
}
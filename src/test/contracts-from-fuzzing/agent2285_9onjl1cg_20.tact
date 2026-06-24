struct Inner1 { a: Int; } 
struct Inner2 { b: Bool; } 
struct Nested {
    i1: Inner1;
    i2: Inner2;
    opt: Inner1?;
}

contract Test20 {
    n: Nested;

    init() {
        self.n = Nested{
            i1: Inner1{ a: 1 },
            i2: Inner2{ b: true },
            opt: null,
        };
    }
}
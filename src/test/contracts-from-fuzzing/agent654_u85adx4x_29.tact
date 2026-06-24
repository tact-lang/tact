message M1 {}
message M2 {}

struct Nested {
    a: M1;
    b: M2?;
}

contract C {
    state: Nested;

    init() {
        self.state = Nested{
            a: M1{},
            b: null,
        };
    }
}
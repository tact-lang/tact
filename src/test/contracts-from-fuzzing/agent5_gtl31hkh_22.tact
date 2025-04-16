// Struct using a message inside
message M {
    a: Int;
}

struct S {
    m: M;
}

contract Test {
    receive() {
        let s: S = S { m: M { a: 1 } };
    }
}
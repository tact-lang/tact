message M {
    id: Int;
}

struct S {
    message: M;
}

contract Test {
    receive() {
        let s: S = S{message: M{id: 10}};
    }
}
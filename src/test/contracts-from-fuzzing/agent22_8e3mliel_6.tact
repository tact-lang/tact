message M {
    a: Int;
}

struct S {
    m: M;
}

contract Test {
    receive(msg: M) {
        let s = S{m: msg};
    }
}
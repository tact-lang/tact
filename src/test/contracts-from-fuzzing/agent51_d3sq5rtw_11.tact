struct S {
    m: M;
}

message M {
    x: Int;
}

contract Test {
    receive(msg: M) {
        // referencing message inside struct
    }
}
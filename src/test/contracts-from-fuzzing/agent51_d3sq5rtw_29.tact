message M {}

struct S {
    x: Int;
}

contract Test {
    receive(msg: M) {
        // empty message is OK
    }
}
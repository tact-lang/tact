message A {
    x: Int;
}

message B {
    y: Int;
}

struct Data {
    a: A;
    b: B;
}

contract Test {
    receive(msg: A) {}
    receive(msg: B) {}
}
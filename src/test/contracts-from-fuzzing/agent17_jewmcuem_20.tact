message A {
    x: Int
}

message B {
    a: A
}

message C {
    b: B
}

contract Test {
    receive(msg: C) {}
}
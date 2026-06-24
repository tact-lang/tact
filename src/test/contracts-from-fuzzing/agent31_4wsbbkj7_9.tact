struct A {
    a: Int;
}

message B {
    b: A;
}

contract Test {
    receive(msg: B) {
        let v = msg.b.a;
    }
}
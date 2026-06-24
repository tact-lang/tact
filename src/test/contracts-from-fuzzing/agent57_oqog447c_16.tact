message A {
    foo: Int;
}
message B {
    foo: Int;
}

contract Test {
    receive(msg: A) {
        let x = msg.foo;
    }
}
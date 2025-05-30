message Foo {
    bar: Int;
}

contract Test {
    receive(msg: Foo) {
        msg.bar = 5;
    }
}
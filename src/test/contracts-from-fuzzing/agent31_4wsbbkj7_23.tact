message Foo {
    data: Int;
}

message Bar {
    data: Int;
}

contract Test {
    receive(msg: Foo) {}
    receive(msg: Bar) {}
}
message Foo {
    bar: Bar;
}

message Bar {
    val: Int;
}

contract TestContract {
    receive(f: Foo) {
        let v = f.bar.val;
    }
}
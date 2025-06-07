struct A {
    f: Int;
}

message B {
    g: A;
}

contract TestContract {
    receive(msg: B) {
        // do nothing
    }
}
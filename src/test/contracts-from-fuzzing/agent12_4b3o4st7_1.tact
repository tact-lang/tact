struct A {
    a: Int;
}

message B {
    a: A;
}

contract Test {
    receive() {
        let a = B{a: A{a: 1}};
    }
}
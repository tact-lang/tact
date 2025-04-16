struct A {
    x: Int;
}

contract Test {
    receive() {
        let a: A = A{x:1};
        a.x = 5;
    }
}
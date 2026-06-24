struct A {
    x: Int;
}

struct B {
    y: A;
}

contract Test {
    receive() {
        let b = B{ y: A{ x: 1 } };
    }
}
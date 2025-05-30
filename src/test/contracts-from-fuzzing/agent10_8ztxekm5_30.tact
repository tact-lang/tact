struct S {
    x: Int;
}

contract Test {
    receive() {
        let a: S = S{x:1};
        let b: S? = a;
    }
}
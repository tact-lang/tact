fun test() {
    let a: Int = 10;
    let b = 5;
    let c = a + b;
    dump(c);
}

contract Test {
    receive() {
        test();
    }
}

fun test() {
    let a: Int = 1 ++ 2;
}

contract TestContract {
    receive() {
        test();
    }
}

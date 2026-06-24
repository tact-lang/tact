contract Test {
    receive() {}
}

contract Main {
    receive() {
        let s = initOf Test();
    }
}

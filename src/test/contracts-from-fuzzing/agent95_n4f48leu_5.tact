contract C(param: Int) {
    // Contract using contract parameters syntax
    receive() {}
}

contract TestC {
    receive() {
        let s = initOf C(7);
        s; // use s to avoid unused variable warning
    }
}
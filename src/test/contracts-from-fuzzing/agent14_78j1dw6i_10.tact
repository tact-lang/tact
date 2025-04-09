contract F {
    // Implicit init (delayed initialization with no explicit init function)
    receive() {}
}

contract TestF {
    receive() {
        let state = initOf F();
    }
}

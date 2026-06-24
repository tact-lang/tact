contract B {
    receive() {}
}

contract TestInitOf {
    receive() {
        let si: StateInit = initOf B();
    }
}

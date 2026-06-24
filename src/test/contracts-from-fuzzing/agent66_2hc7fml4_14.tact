contract E(param: Int) {
    // no init function because using contract parameters
    receive() {}
}

contract TestE {
    receive() {
        let s: StateInit = initOf E(10);
    }
}

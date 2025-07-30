contract B(param: Int) {
    receive() {}
}

contract TestB {
    receive() {
        let stateInitB = initOf B(999);
        let codeB = codeOf B;
    }
}

contract B(param: Int) {
    receive() {}
}

contract TestContract1 {
    receive() {
        let s = initOf B(123);
        let c = codeOf B;
    }
}

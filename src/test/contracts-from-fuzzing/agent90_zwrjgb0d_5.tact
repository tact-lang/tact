contract ParamsContract(x: Int) {
    receive() {}
}

contract UseParams {
    receive() {
        let s = initOf ParamsContract(10);
        let c = codeOf ParamsContract;
    }
}

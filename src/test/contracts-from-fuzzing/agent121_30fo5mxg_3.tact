contract CPContract(param: Int) {}

contract CallerCP {
    receive() {
        let st = initOf CPContract(10);
    }
}

contract ParamsContract(x: Int, y: Int) {}

contract CallerParamsValid {
    receive() {
         let state = initOf ParamsContract(5, 15);
         let code = codeOf ParamsContract;
    }
}

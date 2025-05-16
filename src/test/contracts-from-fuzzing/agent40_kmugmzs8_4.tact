contract ParamContractCorrect(param: Int) {
    // No explicit init
    receive() {
         let s: StateInit = initOf ParamContractCorrect(42);
         let c: Cell = codeOf ParamContractCorrect;
    }
}

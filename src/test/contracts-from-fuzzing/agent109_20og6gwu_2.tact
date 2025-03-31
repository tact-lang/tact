contract TestContract {
    init() {}
    receive() {}
}

contract Main {
    receive() {
       let initPkg = initOf TestContract();
       let codeCell = codeOf TestContract;
    }
}

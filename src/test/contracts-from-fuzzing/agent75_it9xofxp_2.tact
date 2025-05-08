contract TestContract {
    receive() {}
}

contract Container {
    receive() {
         let initPkg = initOf TestContract();
         let code = codeOf TestContract;
    }
}

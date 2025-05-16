contract Test(a: Int) {
    receive() {}
}

contract Main {
    receive() {
         let pkg = initOf Test(123);
         let code = codeOf Test;
    }
}

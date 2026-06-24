contract GoodContract {
    receive() {}
}

contract Test {
    receive() {
         let pkg = initOf GoodContract();
         let code = codeOf GoodContract;
    }
}

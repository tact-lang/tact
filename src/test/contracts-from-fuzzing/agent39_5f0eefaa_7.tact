/* Test for trailing comma in contract parameters and initOf arguments */
contract D(param: Int,) {
    receive() {}
}

contract Test {
    receive() {
        // Using trailing comma in initOf arguments as allowed by syntax
        let initCell = initOf D(10,);
        let codeCell = codeOf D;
    }
}

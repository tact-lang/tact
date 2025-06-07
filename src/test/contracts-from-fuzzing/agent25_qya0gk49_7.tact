contract F(param1: Int, param2: Int) {
    receive() {}
}

contract CallerF {
    receive() {
        // Valid usage with trailing comma in initOf call
        let initCell = initOf F(42, 100,);
        let codeCell = codeOf F;
    }
}

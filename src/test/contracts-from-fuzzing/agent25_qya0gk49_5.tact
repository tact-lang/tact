contract B(param: Int) {
    // Contract with contract parameters syntax
    // No explicit init() is provided, using delayed initialization
    receive() {}
}

contract CallerB {
    receive() {
        // Valid usage: passing correct parameter to initOf
        let initCellB = initOf B(42);
        let codeCellB = codeOf B;
    }
}

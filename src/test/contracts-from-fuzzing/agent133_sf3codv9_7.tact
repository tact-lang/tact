contract Test3 {
    receive() {}
    get fun codeEquality(): Bool {
         // Check that codeOf for current contract is equal to myCode()
         return myCode() == codeOf Test3;
    }
}

contract E {
    // Explicit init function with a parameter
    init(a: Int) {
        // No state modifications
    }
    receive() {}
}

contract Test4 {
    receive() {}
    get fun initEData(): Cell {
         // Retrieve the 'data' cell from the StateInit of contract E
         return initOf E(456).data;
    }
}

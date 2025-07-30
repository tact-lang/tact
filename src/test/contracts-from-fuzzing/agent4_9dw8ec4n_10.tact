/* Test 6: Using initOf with contract parameters and nested initOf in arguments */

contract Child {
    init(x: Int) {
        // Simple initialization for Child
    }
}

contract Parent {
    // Note: Parent expects a Cell (childCode) as second parameter
    init(x: Int, childCode: Cell) {
        // Use the provided childCode in a dummy manner
    }
}

contract Main {
    receive() {
        let childInit = initOf Child(123);
        let childCode = childInit.code;
        let parentInit = initOf Parent(555, childCode);
        // Enforce that the addresses computed for Child and Parent are distinct
        require(contractAddress(childInit) != contractAddress(parentInit), "child and parent addresses should differ");
    }
}

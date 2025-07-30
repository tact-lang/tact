contract CycleA {
    // Recursive cross-contract initialization: CycleA calls initOf CycleB
    init() {
         let dummy = initOf CycleB();
    }
}

contract CycleB {
    // Recursive cross-contract initialization: CycleB calls initOf CycleA
    init() {
         let dummy = initOf CycleA();
    }
}

contract MultiLevelC {
    // A leaf contract in a multi-level dependency chain
    init() {}
}

contract MultiLevelB {
    // Intermediate contract that initializes MultiLevelC
    init() {
         let dummy = initOf MultiLevelC();
    }
}

contract MultiLevelA {
    // Top-level contract that initializes MultiLevelB
    init() {
         let dummy = initOf MultiLevelB();
    }
}

contract RecursiveTest {
    // Getter that uses initOf on itself
    init() {}
    get fun recursiveGetter() : Cell {
         return (initOf RecursiveTest()).code;
    }
}

contract ParamEdge {
    // Contract with a constructor parameter
    init(x: Int) {
        if (x < 0) {
            // do nothing
        }
    }
}

contract ParamCaller {
    // Tests calling initOf with parameters
    fun callParam() : Bool {
         let r = initOf ParamEdge(55);
         let addr = contractAddress(r);
         return addr != address("0:0000000000000000000000000000000000000000000000000000000000000000");
    }
}

contract RecursiveEdge {
    // Test using initOf on itself within its init(), possibly problematic recursion
    init() {
         let dummy = initOf RecursiveEdge();
    }
}

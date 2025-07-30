/* Snippet 7: Branching contract graph with multiple child initializations */

contract Leaf1 {
    init() {}
}

contract Leaf2 {
    init() {}
}

contract Intermediate {
    init() {
        // Initialize two separate leaf contracts
        let leaf1_pkg: StateInit = initOf Leaf1();
        let leaf2_pkg: StateInit = initOf Leaf2();
    }
    
    fun checkIntermediate() : Bool {
        // Can also use initOf in functions
        let leaf1_pkg: StateInit = initOf Leaf1();
        return true;
    }
}

contract Root {
    init() {
        // Branching: initialize intermediate contract
        let inter_pkg: StateInit = initOf Intermediate();
    }
    
    fun verifyGraph() : Bool {
        // Additionally, retrieve init package of Leaf2 directly
        let leaf2_pkg: StateInit = initOf Leaf2();
        return true;
    }
}

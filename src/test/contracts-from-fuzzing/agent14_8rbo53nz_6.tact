// Contract constants and initOf test
const GlobalConst: Int = 1000 + pow(2, 4);

contract TestConst {
    const ContractConst: Int = 2000 + pow(2, 3);

    init(counter: Int) {
        // For testing initOf later
    }

    // Getter function to compute sum of constants
    get fun compute(): Int {
        return GlobalConst + self.ContractConst;
    }

    receive() {}
}

contract TestCaller {
    receive() {
        // Using initOf expression to obtain initial state (StateInit contains code and data)
        let sinit = initOf TestConst(42);
        // Dumping just the data field from the StateInit structure
        dump(sinit.data);
    }
}

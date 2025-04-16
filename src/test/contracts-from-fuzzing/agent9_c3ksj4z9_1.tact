struct BasicStruct {
    field1: Int;
}

contract TestContract {
    state: Int; // Need some state for a valid contract

    init() {
        self.state = 0;
    }

    receive() {
        // Instantiate the struct locally to ensure it's processed
        let _s: BasicStruct = BasicStruct{field1: 1};
    }
}
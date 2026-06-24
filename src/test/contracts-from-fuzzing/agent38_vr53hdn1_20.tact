contract TestContractFields {
    // Persistent state variable with a default value
    field: Int = 100;

    receive() {
        // Access persistent field and perform an arithmetic operation
        dump(self.field + 23); // Expected to dump 123
    }
}

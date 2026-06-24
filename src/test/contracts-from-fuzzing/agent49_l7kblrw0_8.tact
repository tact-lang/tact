contract TestDestructure() {
    // Using destructuring assignment on a StdAddress struct
    fun run() {
        // Create a dummy StdAddress. The structure is expected to have 'workchain' and 'address' fields.
        let st = StdAddress { workchain: 0, address: 100 };
        let StdAddress { workchain, address } = st;
        dump(workchain); // Expect output: 0
        dump(address);   // Expect output: 100
    }

    receive() {
        self.run();
    }
}

contract Runner {
    receive() {
        let myAddr: Address = myAddress();
        let state: StateInit = initOf Runner();
        let computed: Address = contractAddress(state);
        // Compare addresses; this should hold true
        // Since myAddress() and contractAddress(initOf Runner()) should be the same
        // in a workchain scenario.
        // No runtime assertion, just compile-time code for demonstration
        dump(myAddr);
        dump(computed);
    }
}

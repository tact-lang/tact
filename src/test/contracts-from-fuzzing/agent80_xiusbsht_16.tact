contract Test {
    v: Int = 0;
    
    // Receiver function with parameter name shadowing a state variable
    // This tests if the receiver parameter can have the same name as a persistent state variable
    receive(v: String) {
        // Attempt to access both the parameter and the state variable
        let param_val = v;           // should refer to the receiver parameter
        let state_val = self.v;        // should refer to the state variable
    }
}

contract Test_address {
    receive() {
        // Create a map from Address to Int
        let m: map<Address, Int> = emptyMap();
        
        // Set a value using the sender's address as key
        m.set(context().sender, 200);
        
        // Retrieve and dump the value; expected output: 200
        dump(m.get(context().sender)!!);
    }
}

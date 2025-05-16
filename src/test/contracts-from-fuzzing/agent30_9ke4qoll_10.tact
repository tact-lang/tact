contract TestTonValid {
    // Test ton() with a valid format: "0.1" should compile successfully and produce 10^8 nanoToncoins.
    value: Int = ton("0.1");
    
    receive() {}
}

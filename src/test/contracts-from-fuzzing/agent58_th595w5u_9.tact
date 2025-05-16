contract Test9 {
    // Test priority: a specific text receiver and a generic string receiver
    receive("hello") {
        // This receiver should only be triggered by the exact text "hello"
    }
    
    receive(str: String) {
        // This receiver should be triggered by any text not matching specific cases
    }

    get fun dummy(): Int {
        return 0;
    }
}

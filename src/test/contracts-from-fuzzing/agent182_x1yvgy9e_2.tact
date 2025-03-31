contract Test {
    receive("comment") { 
        // This receiver handles messages with specific "comment" text
    }

    // Dummy fallback to ensure contract is fully compiled
    receive() { }
}
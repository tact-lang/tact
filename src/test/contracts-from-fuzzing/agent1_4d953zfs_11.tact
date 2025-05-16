struct Point { x: Int; y: Int; }

contract TestControlFlow(pt: Point) {
    // The constructor parameter 'pt' becomes a persistent field (i.e., self.pt)
    receive() {
        // Destructure the persistent Point
        let Point { x, y } = self.pt;
        // Start with a sum from the fields
        let sum: Int = x + y;
        
        // Use an augmented assignment in a repeat loop
        repeat(3) {
            sum += 1;  // augmented assignment
        }
        
        // Employ a while loop that increases sum until it reaches at least 100
        while (sum < 100) {
            sum += 2;
        }
        
        // Dummy usage to avoid unused warning
        let _ = sum;
        
        cashback(sender());
    }
}

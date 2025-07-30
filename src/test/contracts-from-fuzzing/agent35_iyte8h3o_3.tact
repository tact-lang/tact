contract TestCase2 {
    fun greet(): String {
        let greeting: String = "Hello, World!";
        return greeting;
    }
    
    receive() {
        let output: String = self.greet();
    }
}
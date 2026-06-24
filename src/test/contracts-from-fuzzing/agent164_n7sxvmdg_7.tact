message UniverseCalls {}

contract Test {
    flag: Int = 0;
    
    // Using underscore to discard the parameter
    receive(_: UniverseCalls) {
        self.flag = 42;
    }
    
    // Fallback empty receiver
    receive() {}
}

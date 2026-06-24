contract UnusedGetterTest {
    x: Int = 5;

    // This getter is declared but never used
    get fun unused(): Int {
        return self.x;
    }
    
    receive() {}
}

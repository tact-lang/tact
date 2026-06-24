const GLOBAL: Int = 100;

contract Test {
    const LOCAL: Int = 50;
    
    get fun sum(): Int {
        return GLOBAL + self.LOCAL;
    }

    receive() {
        self.sum();
    }
}

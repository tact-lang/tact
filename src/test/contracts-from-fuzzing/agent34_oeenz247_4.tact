const GLOBAL: Int = 2 + 3;

contract Test2 {
    const LOCAL: Int = GLOBAL * 10;
    
    get fun calc(): Int {
        return self.LOCAL;
    }
}

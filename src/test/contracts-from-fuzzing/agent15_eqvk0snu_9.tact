contract ConstTest2 {
    const Y: Int = 20;
    
    get fun getY(): Int {
        // Accessing contract constant via self
        return self.Y;
    }
}

// Global constant declared outside a contract
const GlobalConst: Int = 100;

contract GlobalConstTest {
    get fun getGlobal(): Int {
        // Global constants can be referenced directly by their name
        return GlobalConst;
    }
}

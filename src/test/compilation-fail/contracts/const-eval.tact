contract ConstantTester {
    init() {
        
    }

    receive() {
        
    }

    get fun something(): Int {
        let x: Int = 2 / 0;
        return x;
    }
}
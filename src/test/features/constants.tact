const someGlobalConst: Int = 100;

contract ConstantTester {
    const something1: Int = 10 + 1;
    const something2: Int? = null;
    const something3: Int = ton("123");
    const something4: Int = ton("123") + ton("333");
    const something5: String = "Hello world!";
    const something6: Int = 10 * 1;
    const something7: Int = 10 >> 1;
    const something8: Int = (2 + 4) & 4;

    init() {
        
    }

    get fun something1(): Int {
        return self.something1;
    }

    get fun something2(): Int? {
        return self.something2;
    }

    get fun something3(): Int {
        return self.something3;
    }
    
    get fun something4(): Int {
        return self.something4;
    }

    get fun something5(): String {
        return self.something5;
    }

    get fun something6(): Int {
        return self.something6;
    }

    get fun something7(): Int {
        return self.something7;
    }

    get fun something8(): Int {
        return self.something8;
    }

    get fun globalConst(): Int {
        return someGlobalConst;
    }
}
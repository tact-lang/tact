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
    const something9: Address = address("UQBKgXCNLPexWhs2L79kiARR1phGH1LwXxRbNsCFF9doczSI");
    const something10: Address = newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873);

    init() {
        
    }

    receive() {
        
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

    get fun something9(): Address {
        return self.something9;
    }

    get fun something10(): Address {
        return self.something10;
    }

    get fun globalConst(): Int {
        return someGlobalConst;
    }
}
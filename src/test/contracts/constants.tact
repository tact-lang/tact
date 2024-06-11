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
    const something11: Int = 123 ^ 35;
    const something12: Int = -123 ^ 35;
    const something13: Int = -123 ^ -35;
    const something14: Int = pow(3, 5);
    const something15: Int = pow2(5);
    const something16: Int = -115792089237316195423570985008687907853269984665640564039457584007913129639936;
    const something17: Int = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    const something18: Int = -(pow2(255) - 1 + pow2(255));
    const something19: Int = -(pow2(255) - 1 + pow2(255)) - 1;
    const something20: Int = ~5;

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

    get fun something11(): Int {
        return self.something11;
    }

    get fun something12(): Int {
        return self.something12;
    }

    get fun something13(): Int {
        return self.something13;
    }

    get fun something14(): Int {
        return self.something14;
    }

    get fun something15(): Int {
        return self.something15;
    }

    get fun something16(): Int {
        return self.something16;
    }

    get fun something17(): Int {
        return self.something17;
    }

    get fun something18(): Int {
        return self.something18;
    }

    get fun something19(): Int {
        return self.something19;
    }
    
    get fun something20(): Int {
        return self.something20;
    }

    get fun minInt1(): Int {
        return -115792089237316195423570985008687907853269984665640564039457584007913129639936;
    }

    get fun minInt2(): Int {
        return -(pow2(255) - 1 + pow2(255));
    }

    get fun minInt3(): Int {
        return -(pow2(255) - 1 + pow2(255)) - 1;
    }

    get fun globalConst(): Int {
        return someGlobalConst;
    }
}
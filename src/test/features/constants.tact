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
    const something9: Bool = true && false;
    const something10: Bool = true || false;
    const something11: Bool = !true;
    const something12: Bool = true == false;
    const something13: Bool = true != false;
    const something14: Bool = !(true == false);
    const something15: Bool = 5 > 5;
    const something16: Bool = 5 >= 5;
    const something17: Bool = "Hello" == "Hello";
    const something18: Bool = "Hello" != "Hello";
    const something19: Bool = "Hello".asCell() == "Hello".asCell();
    const something20: Bool = "Hello".asCell() != "Hello".asCell();
    const something21: Bool = newAddress(0, 0x606813c5f6a76175eae668630c6d8ffe229543610e3d204db245dd51f9ba0503) == newAddress(0, 0x606813c5f6a76175eae668630c6d8ffe229543610e3d204db245dd51f9ba0503);
    const something22: Bool = newAddress(0, 0x606813c5f6a76175eae668630c6d8ffe229543610e3d204db245dd51f9ba0503) != newAddress(0, 0x606813c5f6a76175eae668630c6d8ffe229543610e3d204db245dd51f9ba0503);
    const something23: Bool = "Hello".asCell() == "Hello".asCell();
    const something24: Bool = "Hello".asCell() != "Hello".asCell();

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

    get fun something9(): Bool {
        return self.something9;
    }

    get fun something10(): Bool {
        return self.something10;
    }

    get fun something11(): Bool {
        return self.something11;
    }

    get fun something12(): Bool {
        return self.something12;
    }

    get fun something13(): Bool {
        return self.something13;
    }

    get fun something14(): Bool {
        return self.something14;
    }

    get fun something15(): Bool {
        return self.something15;
    }

    get fun something16(): Bool {
        return self.something16;
    }

    get fun something17(): Bool {
        return self.something17;
    }

    get fun something18(): Bool {
        return self.something18;
    }

    get fun something19(): Bool {
        return self.something19;
    }

    get fun something20(): Bool {
        return self.something20;
    }

    get fun something21(): Bool {
        return self.something21;
    }

    get fun something22(): Bool {
        return self.something22;
    }

    get fun something23(): Bool {
        return self.something23;
    }

    get fun something24(): Bool {
        return self.something24;
    }
}
// Contracts C1 and C2 are identical, except in their names.
// Contract C3f differs from C1 and C2 in that C3f has an extra field.
// Contract C4g differs from C1 and C2 in that C4g has a different name for the getField1 getter.
// Contract C5i differs from C1 and C2 in that C5i has a different variable name in its init method.
// Contract C6fn differs from C1 and C2 in that C6fn has a different name in its field.
// Contract C7gt differs from C1 and C2 in that C7gt has a different variable name in its getter.
// Contract C8h differs from C3f in their field names.
// Contract C9g2 differs from C3f in that C9g2 has a getter for the second contract field.
// Contract C10o differs from C3f in the declaration order of the contract fields.


contract C1 {
    f1: Int;

    init(v: Int) {
        self.f1 = v;
    }

    get fun incrAndGetField1(n: Int): Int {
        return self.f1 + n;
    }
}

contract C2 {
    f1: Int;

    init(v: Int) {
        self.f1 = v;
    }

    get fun incrAndGetField1(n: Int): Int {
        return self.f1 + n;
    }
}

contract C3f {
    f1: Int;
    f2: Int = 100;

    init(v: Int) {
        self.f1 = v;
    }

    get fun incrAndGetField1(n: Int): Int {
        return self.f1 + n;
    }
}

contract C4g {
    f1: Int;

    init(v: Int) {
        self.f1 = v;
    }

    get fun incrAndGetField(n: Int): Int {
        return self.f1 + n;
    }
}

contract C5i {
    f1: Int;

    init(n: Int) {
        self.f1 = n;
    }

    get fun incrAndGetField1(n: Int): Int {
        return self.f1 + n;
    }
}

contract C6fn {
    f: Int;

    init(v: Int) {
        self.f = v;
    }

    get fun incrAndGetField1(n: Int): Int {
        return self.f + n;
    }
}

contract C7gt {
    f1: Int;

    init(v: Int) {
        self.f1 = v;
    }

    get fun incrAndGetField1(t: Int): Int {
        return self.f1 + t;
    }
}

contract C8h {
    h1: Int;
    h2: Int = 100;

    init(v: Int) {
        self.h1 = v;
    }

    get fun incrAndGetField1(n: Int): Int {
        return self.h1 + n;
    }
}

contract C9g2 {
    f1: Int;
    f2: Int = 100;

    init(v: Int) {
        self.f1 = v;
    }

    get fun incrAndGetField1(n: Int): Int {
        return self.f1 + n;
    }

    get fun getField2(): Int {
        return self.f2;
    }
}

contract C10o {
    f2: Int = 100;
    f1: Int;
    
    init(v: Int) {
        self.f1 = v;
    }

    get fun incrAndGetField1(n: Int): Int {
        return self.f1 + n;
    }

    get fun getField2(): Int {
        return self.f2;
    }
}


contract Tester {

    receive() {}

    get fun checkAddressInjectivity(): Bool {
        
        // Two contracts with the same code but with different initialization must have different addresses.
        let addr1: Address = contractAddress(initOf C1(5));
        let addr2: Address = contractAddress(initOf C1(10));

        let result = addr1 != addr2;

        // Two contracts with the same code and equal initialization must have the same address.
        let addr3: Address = contractAddress(initOf C1(5));
        let addr4: Address = contractAddress(initOf C1(5));

        result &&= addr3 == addr4;

        // Two contracts with exactly the same code but different names and with same initialization, produce the same address.
        // Observe that C1 and C2 are identical, except in their name.
        let addr5: Address = contractAddress(initOf C1(5));
        let addr6: Address = contractAddress(initOf C2(5));

        result &&= addr5 == addr6;

        // Two contracts with exactly the same code but different names and different initialization must have different addresses.
        let addr7: Address = contractAddress(initOf C1(5));
        let addr8: Address = contractAddress(initOf C2(10));

        result &&= addr7 != addr8;

        // Two contracts with different code and equal initialization have different addresses.
        // Note that C3f differs from C1 in that C3f has an extra field.
        let addr9: Address = contractAddress(initOf C1(5));
        let addr10: Address = contractAddress(initOf C3f(5));

        result &&= addr9 != addr10;

        // Two contracts with different code and equal initialization have different addresses.
        // Note that C4g differs from C1 in that C4g has a different name for the getter.
        let addr11: Address = contractAddress(initOf C1(5));
        let addr12: Address = contractAddress(initOf C4g(5));

        result &&= addr11 != addr12;

        // Two contracts with similar code and equal initialization have equal addresses.
        // "Similar" here means that parameter names in functions are allowed to be different.
        // Note that C5i differs from C1 in that C5i has a different name for the variable in the init method.
        let addr13: Address = contractAddress(initOf C1(5));
        let addr14: Address = contractAddress(initOf C5i(5));

        result &&= addr13 == addr14;

        // Two contracts with similar code and equal initialization have equal addresses.
        // "Similar" here means that contract field names are allowed to be different.
        // Note that C6fn differs from C1 in that C6fn has a different name for the contract field.
        let addr15: Address = contractAddress(initOf C1(5));
        let addr16: Address = contractAddress(initOf C6fn(5));

        result &&= addr15 == addr16;

        // Two contracts with similar code and equal initialization have equal addresses.
        // "Similar" here means that parameter names in functions are allowed to be different.
        // Note that C7gt differs from C1 in that C7gt has a different name for the parameter in the getter.
        let addr17: Address = contractAddress(initOf C1(5));
        let addr18: Address = contractAddress(initOf C7gt(5));

        result &&= addr17 == addr18;

        // Two contracts with similar code and equal initialization have equal addresses.
        // "Similar" here means that contract field names are allowed to be different.
        // Note that C3f differs from C8h in that C8h has a different name for the two fields in C3f.
        let addr19: Address = contractAddress(initOf C3f(5));
        let addr20: Address = contractAddress(initOf C8h(5));

        result &&= addr19 == addr20;

        // Two contracts with different code produce different addresses.
        // C3f differs from C9g2 in that C9g2 has an extra getter.
        let addr21: Address = contractAddress(initOf C3f(5));
        let addr22: Address = contractAddress(initOf C9g2(5));

        result &&= addr21 != addr22;

        // Two contracts almost identical, but with their fields declared in different order, produce different addresses.
        // Note that C9g2 differs from C10o in that C10o has the fields declared in different order.
        let addr23: Address = contractAddress(initOf C9g2(5));
        let addr24: Address = contractAddress(initOf C10o(5));

        result &&= addr23 != addr24;

        return result;
    }
}


const someGlobalConst: Int = 100;

struct S {
    a: Bool;
    b: Int;
}

struct T {
    a: Int;
    s: S;
}

contract ConstantTester {
    const something1: Int = 10 + 1;
    const something2: Int? = null;
    const something3: Int = ton("123");
    const something4: Int = ton("123") + ton("33.3") * 10;
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
    // division rounds towards negative infinity, like Python's `//` operator
    const something21: Int = 1 / 5; // = 0, as one would expect
    const something22: Int = -1 / 5; // = -1, not zero as in JS/TS
    const something23: Int = 1 / -5; // = -1, not zero as in JS/TS
    const something24: Int = -1 / -5; // = 0, as one would expect
    // modulo rounds towards negative infinity too
    // the following holds: a / b * b + a % b == a, for all b != 0
    const something25: Int = 1 % 5; // = 1
    const something26: Int = -1 % 5; // = 4
    const something27: Int = 1 % -5; // = -4
    const something28: Int = -1 % -5; // = -1

    const something29: Int? = true ? 42 : null;
    const something30: Int? = false ? 42 : null;
    const something31: Int = false ? (1 / 0) : 42; // no exception, then branch is ignored

    const something32: Int = (true ? 42 : null)!!;

    const something33: map<Int, Int> = emptyMap();
    const something34: map<Int, Int> = null;

    const something35: S = S {a: false || false, b: 21 + 21};
    const something36: S = S {b: 21 + 21, a: false || false};
    const something37: T = T {
        a: pow(3, 3) + 3 * 5,
        s: S {a: true ? 1 == 1 : false, b: ton("0.000000042")}
    };

    const something38: Int = 5 & 6 | 1 << (5 + 11) * 3 % 12 >> 11; // = 4

    const something39: Bool = 42 == 43 || "foo" == "bar" || true != true ||
                              3 < 1 || 3 <= 1 || 1 < 3 || 1 <= 3 ||
                              newAddress(0, 0x606813c5f6a76175eae668630c6d8ffe229543610e3d204db245dd51f9ba0503)
                              !=
                              newAddress(0, 0x606813c5f6a76175eae668630c6d8ffe229543610e3d204db245dd51f9ba0503) ||
                              !(true && false);

    const something40: Bool = T {
        a: pow(3, 3) + 3 * 5,
        s: S {a: true ? 1 == 1 : false, b: ton("0.000000042")}
    }.s.a;

    const something41: Address = newAddress(0, 0);
    const something42: Address = newAddress(0, 0x12345);
    const something43: Address = newAddress(0, 0x123456789abcdef);
    const something44: Address = newAddress(0, 0x4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873);

    init() { }

    receive() { }

    get fun something1(): Int { return self.something1; }
    get fun something2(): Int? { return self.something2; }
    get fun something3(): Int { return self.something3; }
    get fun something4(): Int { return self.something4; }
    get fun something5(): String { return self.something5; }
    get fun something6(): Int { return self.something6; }
    get fun something7(): Int { return self.something7; }
    get fun something8(): Int { return self.something8; }
    get fun something9(): Address { return self.something9; }
    get fun something10(): Address { return self.something10; }
    get fun something11(): Int { return self.something11; }
    get fun something12(): Int { return self.something12; }
    get fun something13(): Int { return self.something13; }
    get fun something14(): Int { return self.something14; }
    get fun something15(): Int { return self.something15; }
    get fun something16(): Int { return self.something16; }
    get fun something17(): Int { return self.something17; }
    get fun something18(): Int { return self.something18; }
    get fun something19(): Int { return self.something19; }
    get fun something20(): Int { return self.something20; }
    get fun something21(): Int { return self.something21; }
    get fun something22(): Int { return self.something22; }
    get fun something23(): Int { return self.something23; }
    get fun something24(): Int { return self.something24; }
    get fun something25(): Int { return self.something25; }
    get fun something26(): Int { return self.something26; }
    get fun something27(): Int { return self.something27; }
    get fun something28(): Int { return self.something28; }
    get fun something29(): Int? { return self.something29; }
    get fun something30(): Int? { return self.something30; }
    get fun something31(): Int { return self.something31; }
    get fun something32(): Int { return self.something32; }
    get fun something33(): map<Int, Int> { return self.something33; }
    get fun something34(): map<Int, Int> { return self.something34; }
    get fun something35(): S { return self.something35; }
    get fun something36(): S { return self.something36; }
    get fun something37(): T { return self.something37; }
    get fun something38(): Int { return self.something38; }
    get fun something39(): Bool { return self.something39; }
    get fun something40(): Bool { return self.something40; }
    get fun something41(): Address { return self.something41; }
    get fun something42(): Address { return self.something42; }
    get fun something43(): Address { return self.something43; }
    get fun something44(): Address { return self.something44; }

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
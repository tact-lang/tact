message(0b10) Bin {}

struct A {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: Int;
    g: Int;
}

struct B {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: Int;
    g: Int;
}

struct C {
    a: Cell;
    b: Cell?;
    c: Slice?;
    d: Slice?;
    e: Bool;
    f: Int;
    g: Int;
    h: Address;
}

const EXIT_CODE: Int = 1000;

contract MainContract {
    field: Int as uint8;
    value: Int as int256;
    data: Slice as bytes64;
    mapping: map<Int as uint8, Int as int256>;

    receive("Text\x00receiver\x01.\nThis \x07 is \x0D a \x1F test \x7F comment \x9F with \x08 bad \x0C chars") {}

    receive(m: Bin) { require(m.opcode() == 2, "Incorrect message opcode: binary literal") }

    init(field: Int as uint8, value: Int as int256, data: Slice as bytes64, mapping: map<Int as uint8, Int as int256>) {
        self.field = field;
        self.value = value;
        self.data = data;
        self.mapping = mapping;
    }

    get fun testAugmentedAssignOperators(intVal: Int, intVal2: Int, boolVal: Bool, boolVal2: Bool): Int {
        let a = intVal;

        a += intVal2;
        a -= intVal2;

        let b = boolVal;

        b &&= boolVal2;
        b ||= boolVal2;

        return a + (b ? 10 : 20);
    }

    get fun writeSerializationForA(): A {
        return A {
            a: 1,
            b: 2,
            c: null,
            d: false,
            e: true,
            f: 3,
            g: 4
        }
    }

    get fun writeSerializationForB(): B {
        return B {
            a: 1,
            b: 2,
            c: null,
            d: false,
            e: null,
            f: 3,
            g: 4
        }
    }

    get fun writeSerializationForC(): C {
        return C {
            a: beginCell().storeInt(0, 32).endCell(),
            b: null,
            c: null,
            d: null,
            e: true,
            f: 1,
            g: 2,
            h: myAddress()
        }
    }

    const FOO_ZERO: Int = 0;
    const FOO_ONE: Int = 1;
    const EXIT_CODE: Int = 999;

    get fun testIfOptimizationPositive(a: Int,  b: Int?) {
        if (a == 0) {
            return;
        }

        if (a != 0) {
            return;
        }

        if (0 == a) {
            return;
        }

        if (0 != a) {
            return;
        }

        if (a == self.FOO_ZERO) {
            return;
        }

        if (a != self.FOO_ZERO) {
            return;
        }

        if (self.FOO_ZERO == a) {
            return;
        }

        if (self.FOO_ZERO != a) {
            return;
        }

        if (a == self.FOO_ONE - 1) {
            return;
        }

        if (a != self.FOO_ONE - 1) {
            return;
        }

        if (self.FOO_ONE - 1 == a) {
            return;
        }

        if (self.FOO_ONE - 1 != a) {
            return;
        }

        if (b!! == 0) {
            return;
        }

        if (b!! != 0) {
            return;
        }
    }

    get fun testIfOptimizationComplexPositive(a: Int) {
        if (a == 0) {
            return;
        } else if (a != 0) {
            return;
        }

        if (a == 0) {
            if (a == 0) {
                return;
            } else if (0 != a) {
                return;
            }
        } else if (a != 0) {
            if (0 == a) {
                return;
            } else if (a == 0) {
                return;
            }
        }
    }

    get fun testIfOptimizationNegative(a: Int, b: Int?) {
        if (a == self.FOO_ONE) {
            return;
        }

        if (a != self.FOO_ONE) {
            return;
        }

        if (self.FOO_ONE == a) {
            return;
        }

        if (self.FOO_ONE != a) {
            return;
        }

        if (b == 0) {
            return;
        }

        if (b != 0) {
            return;
        }
    }

    get fun testDumpCall(a: Int) {
        dump(a);
        dumpStack();
    }

    get fun testIfThrowOptimization(a: Int) {
        if (a == self.FOO_ONE) {
            throw(10);
        }

        let cond = a == self.FOO_ONE;
        if (!cond) {
            throw(10);
        }

        if (a == self.FOO_ONE) {
            throw(EXIT_CODE);
        }

        if (a == self.FOO_ONE) {
            throw(EXIT_CODE + 11);
        }

        if (a == self.FOO_ONE) {
            throw(self.EXIT_CODE / 2);
        }
    }

    get fun testIfThrowOptimizationNegative(a: Int) {
        if (a == self.FOO_ONE) {
            throwIf(10, true);
        }

        let cond = a == self.FOO_ONE;
        if (!cond) {
            dump(10);
            throw(10);
        }

        if (a != self.FOO_ONE) {
            dump(10);
            return;
        }

        if (cond) {} else if (a == self.FOO_ONE) {
            throw(10);
        }

        let x: Int = 42;
        if (x.inc() == 0) {
            throw(x.inc());
        }

        if (a == self.FOO_ONE) {
            throw(bar());
        }

        if (a == self.FOO_ONE) {
            throw(10);
        } else {
            throw(11);
        }
    }
}

extends mutates fun inc(self: Int): Int { self += 1; return self }
fun bar(): Int { return 10 }

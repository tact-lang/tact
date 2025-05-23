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

contract MainContract {
    field: Int as uint8;
    value: Int as int256;
    data: Slice as bytes64;
    mapping: map<Int as uint8, Int as int256>;

    receive("Text\x00receiver\x01.\nThis\x07is\x0Da\x1Ftest\x7Fcomment\x9Fwith\x08bad\x0Cchars") {}

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

    get fun testIfOptimizationPositive(a: Int) {
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

    get fun testIfOptimizationNegative(a: Int) {
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
    }
}

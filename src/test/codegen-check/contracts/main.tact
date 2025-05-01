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

message Message1 {
    a: Int;
}

message Message2 {
    value: Cell;
    value2: Slice;
}

message Message3 {
    val1: Int;
    val2: Int;
    val3: Int;
    val4: Int;
    val5: Int;
    val6: Int;
}

contract MainContract {
    field: Int as uint8;
    value: Int as int256;
    data: Slice as bytes64;
    mapping: map<Int as uint8, Int as int256>;

    init(field: Int as uint8, value: Int as int256, data: Slice as bytes64, mapping: map<Int as uint8, Int as int256>) {
        self.field = field;
        self.value = value;
        self.data = data;
        self.mapping = mapping;
    }

    receive(msg: Message1) {
        throw(msg.a);
    }

    receive(msg: Message2) {
        let sc_1 = 10;
        let sc_2 = 20;
        let in_msg = sc_1 + sc_2;
        if (in_msg == 0) {
            throw(in_msg);
        }

        throw(msg.value.depth() + msg.value2.depth());
    }

    receive(msg: Message3) {
        throw(msg.val1 + msg.val2 + msg.val3 + msg.val4 + msg.val5 + msg.val6);
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
